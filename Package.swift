// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "ContributionsHeatmap",
    platforms: [
        .iOS(.v16),
        .macCatalyst(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .visionOS(.v1),
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: "ContributionsHeatmap",
            targets: ["ContributionsHeatmap"]
        )
    ],
    targets: [
        .target(
            name: "ContributionsHeatmap",
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        )
    ],
    swiftLanguageModes: [.v6]
)
