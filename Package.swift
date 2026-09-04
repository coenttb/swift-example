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
        .library(
            name: "Example Greeting",
            targets: ["Example Greeting"]
        ),
        .library(
            name: "Example Counter",
            targets: ["Example Counter"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-tagged.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Example"
        ),
        .target(
            name: "Example Greeting",
            dependencies: [
                "Example",
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .target(
            name: "Example Counter",
            dependencies: [
                "Example",
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .testTarget(
            name: "Example Greeting Tests",
            dependencies: [
                "Example",
                "Example Greeting",
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .testTarget(
            name: "Example Counter Tests",
            dependencies: [
                "Example",
                "Example Counter",
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
