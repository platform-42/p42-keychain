import PackageDescription

let package = Package(
    name: "P42-keychain",
    products: [
        .library(
            name: "P42-keychain",
            targets: ["P42-keychain"]),
    ],
    targets: [
        .target(
            name: "P42-keychain"),
        .testTarget(
            name: "P42-keychainTests",
            dependencies: ["P42-keychain"]),
    ]
)
