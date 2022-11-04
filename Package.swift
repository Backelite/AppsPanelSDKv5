// swift-tools-version:5.6.0

import PackageDescription

let package = Package(
    name: "AppsPanelSDKv5",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "AppsPanelSDK",
            targets: ["AppsPanelSDKWithDependencies"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.5.0")),
        .package(url: "https://github.com/Kitura/Swift-JWT.git", .upToNextMajor(from: "3.6.200")),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", .upToNextMajor(from: "4.2.2")),
    ],
    targets: [
        .binaryTarget(
            name: "AppsPanelSDK",
            path: "AppsPanelSDK.xcframework"
        ),
        .target(
            name: "AppsPanelSDKWithDependencies",
            dependencies: [
                .target(name: "AppsPanelSDK"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SwiftJWT", package: "Swift-JWT"),
                .product(name: "KeychainAccess", package: "KeychainAccess"),
            ],
            path: "Sources",
            resources: [
                .copy("../AppsPanelResources.bundle"),
            ]
        )
    ]
)
