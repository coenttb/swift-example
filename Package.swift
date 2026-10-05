// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-example",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Example",
            targets: ["Example"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-tagged.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-interface.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-client.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-either.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Example",
            dependencies: [
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Interface Macro", package: "swift-interface"),
                .product(name: "Client Macro", package: "swift-client"),
            ]
        ),
        .testTarget(
            name: "Example Tests",
            dependencies: [
                "Example",
                .product(name: "Either", package: "swift-either"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
