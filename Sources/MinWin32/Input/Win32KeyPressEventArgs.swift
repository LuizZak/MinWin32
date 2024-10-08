public struct Win32KeyPressEventArgs: @unchecked Sendable {
    public let keyChar: Character
    public let modifiers: Win32KeyboardModifier

    @_transparent
    public init(keyChar: Character, modifiers: Win32KeyboardModifier) {
        self.keyChar = keyChar
        self.modifiers = modifiers
    }
}
