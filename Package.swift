// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feedac-CoreRedux",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Feedac CoreRedux",
            targets: ["Feedac CoreRedux"]),
    ],
    targets: [
        .target(
            name: "Feedac CoreRedux",
            dependencies: []),
        .testTarget(
            name: "Feedac CoreReduxTests",
            dependencies: ["Feedac CoreRedux"]),
    ],
    swiftLanguageVersions: [
        .version("5")
    ]
)
