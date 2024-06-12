// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "KokateamQuickActions",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "KokateamQuickActions",
            targets: ["QuickActionsPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "QuickActionsPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/QuickActionsPlugin"),
        .testTarget(
            name: "QuickActionsPluginTests",
            dependencies: ["QuickActionsPlugin"],
            path: "ios/Tests/QuickActionsPluginTests")
    ]
)
