// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ActionTest",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ActionTest",
            targets: ["ActionTest"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/yume190/LeakDetect", branch: "DangerPlugin"),
        .package(url: "https://github.com/danger/swift", from: "3.17.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ActionTest",
            dependencies: [
                // .product(name: "LeakDetectDangerPlugin", package: "DangerPlugin"),
            ]),
        // .target(name: "Dangerfile", dependencies: ["Danger"], path: ".danger"),
        .executableTarget(name: "DangerDependencies", dependencies: [
            .product(name: "Danger", package: "swift"),
            .product(name: "LeakDetectDangerPlugin", package: "LeakDetect"),
            // "Danger", "DangerPlugin"
            ]
        ), // dev

        .testTarget(
            name: "ActionTestTests",
            dependencies: ["ActionTest"]),
    ]
)
