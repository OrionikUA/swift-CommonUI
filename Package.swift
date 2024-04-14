// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftCommonUI",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "SwiftCommonUI",
            targets: ["SwiftCommonUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/OrionikUA/swift-Common.git", branch: "master"),
    ],
    targets: [
        .target(
            name: "SwiftCommonUI",
            dependencies: [],
            path: "Sources"),
    ]
)
