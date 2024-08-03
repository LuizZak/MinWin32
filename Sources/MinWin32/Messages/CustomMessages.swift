import WinSDK

/// Enumeration containing static member referencing all custom messages known to
/// the library.
public enum CustomMessages {
    /// Gets a list of all custom messages.
    public static var allMessages: [any CustomMessage.Type] {
        return [
            LayoutMessage.self,
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
