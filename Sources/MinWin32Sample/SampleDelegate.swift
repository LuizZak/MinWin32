import MinWin32

class SampleDelegate: MinWin32AppDelegate {
    func appDidLaunch() throws {
        let window = SampleWindow()

        window.show(position: .centered)
    }
}
