// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "ContributionsHeatmap",
    platforms: [
        .iOS(.v17),
        .macCatalyst(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .visionOS(.v2),
        .watchOS(.v10)
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
