// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "MinWin32",
    products: [
        .library(
            name: "MinWin32",
            targets: ["MinWin32"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.1"),
        .package(url: "https://github.com/compnerd/swift-com.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "MinWin32",
            dependencies: [
                .product(name: "SwiftCOM", package: "swift-com"),
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .executableTarget(
            name: "MinWin32Sample",
            dependencies: [
                "MinWin32",
            ],
            exclude: [
                "MinWin32Sample.exe.manifest",
            ],
            // Append settings required to run the executable on Windows
            swiftSettings: [
                .unsafeFlags([
                    "-parse-as-library",
                ]),
            ],
            linkerSettings: [
                .linkedLibrary("User32"),
                .linkedLibrary("ComCtl32"),
                .unsafeFlags([
                    "-Xlinker",
                    "/SUBSYSTEM:WINDOWS",
                ]),
                .unsafeFlags([
                    "-Xlinker",
                    "/DEBUG",
                ], .when(configuration: .debug)),
            ]
        ),
        .testTarget(
            name: "MinWin32Tests",
            dependencies: ["MinWin32"]
        ),
    ]
)
