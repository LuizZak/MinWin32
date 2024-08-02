import Foundation
import WinSDK
import MinWin32

var app: MinWin32App!

@_silgen_name("wWinMain")
func wWinMain(
    _ hInstance: HINSTANCE,
    _ hPrevInstance: HINSTANCE,
    _ pCmdLine: PWSTR,
    _ nCmdShow: CInt
) -> CInt {

    return try! start()
}

func start() throws -> CInt {
    try? setupLogging()

    let delegate = SampleDelegate()

    app = MinWin32App(delegate: delegate)
    return try app.run()
}

func setupLogging() throws {
    let appDataPath = try SystemPaths.localAppData()

    let logFolder =
    appDataPath
        .appendingPathComponent("MinWin32")
        .appendingPathComponent("Sample")

    try FileManager.default.createDirectory(at: logFolder, withIntermediateDirectories: true)

    let logPath =
    logFolder
        .appendingPathComponent("log.txt")

    try WinLogger.setup(logFileUrl: logPath, label: "com.minwin32.sample.log")
}
