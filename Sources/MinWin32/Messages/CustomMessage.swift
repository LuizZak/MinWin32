import WinSDK

/// Global storage for custom messages by name.
var globalMessages: [String: UINT] = [:]

/// Protocol for intra- and inter-process messages.
public protocol CustomMessage {
    static var messageName: String { get }
    static var messageHandle: UINT { get set }

    var uMsg: UINT { get }
    var wParam: WPARAM { get }
    var lParam: LPARAM { get }

    /// Registers this custom message by name so it can be referenced by multiple
    /// applications by name.
    ///
    /// Returns the unique identifier for the message. If the message has a unique
    /// name, this value is guaranteed to be unique globally and can be used to
    /// communicate with other applications.
    ///
    /// In case the message is exclusively private, the protocol implementer must
    /// override this method and return a unique value in the range `WM_USER` to
    /// `0x7FFF`, instead.
    @discardableResult
    static func registerOnce() throws -> UINT
}

public extension CustomMessage {
    static func registerOnce() throws -> UINT {
        return try ensureMessageRegistered(messageType: self)
    }
}

internal func ensureMessageRegistered<T: CustomMessage>(messageType: T.Type) throws -> UINT {
    let name = messageType.messageName
    let messageHandle = try ensureMessageRegistered(name: name)
    messageType.messageHandle = messageHandle

    return messageHandle
}

internal func ensureMessageRegistered(name: String) throws -> UINT {
    if let cached = globalMessages[name] {
        return cached
    }

    return try registerMessage(name: name)
}

internal func registerMessage(name: String) throws -> UINT {
    assert(!name.isEmpty)

    return try name.withUnsafeLPCWSTRPointer { ptr in
        let result = RegisterWindowMessageW(ptr)
        if result == 0 {
            throw Win32Error(win32: GetLastError())
        }

        return result
    }
}
