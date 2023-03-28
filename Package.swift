// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CleevioValidators",
    products: [
        .library(
            name: "CleevioValidators",
            targets: ["CleevioValidators"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "CleevioValidators",
            dependencies: []),
        .testTarget(
            name: "CleevioValidatorsTests",
            dependencies: ["CleevioValidators"]),
    ]
)
