// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPlus",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "SwiftPlus",
            targets: ["SwiftPlus"]),
    ],
    targets: [
        .target(
            name: "SwiftPlus",
            dependencies: []),
        .testTarget(
            name: "SwiftPlusTests",
            dependencies: ["SwiftPlus"]),
    ]
)
