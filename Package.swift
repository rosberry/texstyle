// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Texstyle",
    platforms: [
        .iOS(.v9), .tvOS(.v9), .macOS(.v10_15)
    ],
    products: [
        .library(name: "Texstyle", targets: ["Texstyle"])
    ],
    targets: [
        .target(name: "Texstyle", path: "Texstyle/Texstyle"),
        .testTarget(name: "TexstyleTests", dependencies: ["Texstyle"], path: "Texstyle/TexstyleTests")
    ]
)
