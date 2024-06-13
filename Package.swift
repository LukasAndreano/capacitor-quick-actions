// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorQuickActions",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorQuickActions",
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
            path: "ios/Sources/QuickActionsPlugin")
    ]
)
