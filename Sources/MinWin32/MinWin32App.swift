import Foundation
import WinSDK
import SwiftCOM

/// Base class for Win32 run loops.
///
/// Contains event handling and a built-in minimal RunLoop support.
open class MinWin32App {
    public let delegate: MinWin32AppDelegate
    public var mainLoopBehavior: MainLoopMode = .wait

    public init(delegate: MinWin32AppDelegate) {
        self.delegate = delegate
    }

    /// Dispatches a closure to perform on the main thread queue.
    public func dispatchMain(_ block: @escaping () -> Void) {
        RunLoop.main.perform {
            block()
        }
    }

    /// Marks the program as finished executing and quits.
    /// The program is not quit immediately, and may still process events after
    /// the quit request before closing.
    public func requestQuit() {
        WinLogger.info("Application requested termination.")

        PostQuitMessage(0)
    }

    /// Initializes the main run loop of the application.
    ///
    /// Subclasses should call this method as the last statement and return its
    /// return value.
    open func run() throws -> Int32 {
        // Register custom messages
        for custom in CustomMessages.allMessages {
            custom.messageHandle = try custom.registerOnce()
        }

        // Initialize COM
        do {
            try CoInitializeEx(COINIT_MULTITHREADED)
        } catch {
            WinLogger.error("CoInitializeEx: \(error)")
            return EXIT_FAILURE
        }

        // Enable Per Monitor DPI Awareness
        if !SetProcessDpiAwarenessContext(DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2) {
            WinLogger.error("SetProcessDpiAwarenessContext: \(Win32Error(win32: GetLastError()))")
        }

        let dwICC: DWORD =
            DWORD(ICC_BAR_CLASSES) |
            DWORD(ICC_DATE_CLASSES) |
            DWORD(ICC_LISTVIEW_CLASSES) |
            DWORD(ICC_NATIVEFNTCTL_CLASS) |
            DWORD(ICC_PROGRESS_CLASS) |
            DWORD(ICC_STANDARD_CLASSES)

        var ICCE: INITCOMMONCONTROLSEX =
            INITCOMMONCONTROLSEX(
                dwSize: DWORD(MemoryLayout<INITCOMMONCONTROLSEX>.size),
                dwICC: dwICC
            )

        if !InitCommonControlsEx(&ICCE) {
            WinLogger.error("InitCommonControlsEx: \(Win32Error(win32: GetLastError()))")
        }

        var pAppRegistration: PAPPSTATE_REGISTRATION?
        let ulStatus =
            RegisterAppStateChangeNotification(
                pApplicationStateChangeRoutine,
                unsafeBitCast(self as AnyObject, to: PVOID.self),
                &pAppRegistration
            )

        if ulStatus != ERROR_SUCCESS {
            WinLogger.error("RegisterAppStateChangeNotification: \(Win32Error(win32: GetLastError()))")
        }

        try delegate.appDidLaunch()

        var msg: MSG = MSG()
        var nExitCode: Int32 = EXIT_SUCCESS

        mainLoop: while true {
            // Process all messages in thread's message queue; for GUI applications
            // UI events must have high priority.
            while PeekMessageW(&msg, nil, 0, 0, UINT(PM_REMOVE)) {
                if msg.message == UINT(WM_QUIT) {
                    nExitCode = Int32(msg.wParam)
                    break mainLoop
                }

                TranslateMessage(&msg)
                DispatchMessageW(&msg)
            }

            var time: Date? = nil
            repeat {
                // Execute Foundation.RunLoop once and determine the next time the timer
                // fires.  At this point handle all Foundation.RunLoop timers, sources and
                // Dispatch.DispatchQueue.main tasks
                time = RunLoop.main.limitDate(forMode: .default)

                // If Foundation.RunLoop doesn't contain any timers or the timers should
                // not be running right now, we interrupt the current loop or otherwise
                // continue to the next iteration.
            } while (time?.timeIntervalSinceNow ?? -1) <= 0

            switch mainLoopBehavior {
            case .wait:
                // Yield control to the system until the earlier of a requisite timer
                // expiration or a message is posted to the runloop.
                _ = MsgWaitForMultipleObjects(
                    0, nil, false,
                    DWORD(exactly: time?.timeIntervalSinceNow ?? -1)
                        ?? INFINITE,
                    QS_ALLINPUT | DWORD(QS_KEY) | QS_MOUSE | DWORD(QS_RAWINPUT)
                )

            case .realTime:
                break
            }
        }

        return nExitCode
    }

    internal func didMoveToForeground() {
        delegate.appDidMoveToForeground()
    }

    internal func didMoveToBackground() {
        delegate.appDidMoveToBackground()
    }

    /// Describes the desired behavior of the main UI loop of the application.
    public enum MainLoopMode {
        /// The end of the loop is gated with a wait operation for further events
        /// and timers. Leads to a less busy run loop.
        ///
        /// This is the default main loop behavior.
        case wait

        /// The end of the loop is not gated, and loops back to the start of the
        /// message pump immediately. Suitable for real-time applications that
        /// require constant loops.
        case realTime
    }
}

private let pApplicationStateChangeRoutine: PAPPSTATE_CHANGE_ROUTINE = { (quiesced: UInt8, context: PVOID?) in
    guard let app = unsafeBitCast(context, to: AnyObject.self) as? MinWin32App else {
        return
    }

    let foregrounding: Bool = quiesced == 0
    if foregrounding {
        app.didMoveToForeground()
    } else {
        app.didMoveToBackground()
    }
}
