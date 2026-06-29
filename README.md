# ContributionsHeatmap

A heatmap in the style of GitHub's contributions heatmap on each user profile.

![Screenshot of a contributions heatmap](screenshot.jpg)

## Requirements

This package uses Swift Charts under the hood, and has the same requirements:

- macOS 13
- iOS 16
- tvOS 16
- watchOS 9
- visionOS 1

## Installation

Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/sgade/swiftui-contributionsheatmap", from: "1.0.0")
],
targets: [
    .target(name: "YourTarget", dependencies: [
        .product(name: "ContributionsHeatmap", package: "swiftui-contributionsheatmap")
    ])
]
```

Or in Xcode: **File → Add Package Dependencies…** → paste the repo URL.

## Getting started

Adding a heatmap to your views:

```swift
ContributionsHeatmap(
    data: [...]
)
```

## LICENSE

See `LICENSE`.
