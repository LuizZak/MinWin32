import WinSDK

/// Enumeration containing static member referencing all custom messages known to
/// the library.
public enum CustomMessages {
    /// Gets a list of all custom messages.
    public static var allMessages: [any CustomMessage.Type] {
        return [
            LayoutMessage.self,
            InvalidateMessage.self,
        ]
    }
}

/// A custom message issued to perform window layout.
public struct LayoutMessage: CustomMessage {
    /// Global message name.
    public static var messageName: String = "MW32_LAYOUT"

    /// Globally-registered message handle.
    public static var messageHandle: UINT = 0

    public var uMsg: UINT
    public var wParam: WPARAM
    public var lParam: LPARAM

    public init(uMsg: UINT = Self.messageHandle, wParam: WPARAM = 0, lParam: LPARAM = 0) {
        self.uMsg = uMsg
        self.wParam = wParam
        self.lParam = lParam
    }

    public static func registerOnce() throws -> UINT {
        UINT(bitPattern: WM_USER) + 0x001
    }
}

/// A custom message issued to perform window invalidation.
public struct InvalidateMessage: CustomMessage {
    /// Global message name.
    public static var messageName: String = "MW32_INVALIDATE"

    /// Globally-registered message handle.
    public static var messageHandle: UINT = 0

    public var uMsg: UINT
    public var wParam: WPARAM
    public var lParam: LPARAM

    public var x: LONG {
        LONG(LOWORD(wParam))
    }
    public var y: LONG {
        LONG(HIWORD(wParam))
    }
    public var width: LONG {
        LONG(LOWORD(lParam))
    }
    public var height: LONG {
        LONG(HIWORD(lParam))
    }

    public init(uMsg: UINT = Self.messageHandle, x: LONG, y: LONG, width: LONG, height: LONG) {
        let wParam = WPARAM(x) | (WPARAM(y) << 16)
        let lParam = LPARAM(width) | (LPARAM(height) << 16)

        self.init(uMsg: uMsg, wParam: wParam, lParam: lParam)
    }

    public init(uMsg: UINT = Self.messageHandle, wParam: WPARAM = 0, lParam: LPARAM = 0) {
        self.uMsg = uMsg
        self.wParam = wParam
        self.lParam = lParam
    }

    public static func registerOnce() throws -> UINT {
        UINT(bitPattern: WM_USER) + 0x002
    }
}
