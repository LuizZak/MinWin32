import MinWin32

class SampleWindow: Win32Window {
    init() {
        super.init(
            settings: .init(
                title: "Sample Window",
                size: .init(width: 800, height: 600)
            )
        )
    }

    override func onClose(_ message: WindowMessage) {
        app.requestQuit()
    }
}
