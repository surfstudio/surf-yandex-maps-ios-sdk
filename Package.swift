// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
// Lite version for YandexMapsMobile
import PackageDescription

let package = Package(
    name: "YandexMapsMobile",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "YandexMapsMobile",
            targets: ["YandexMapsMobile"])
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "YandexMapsMobile",
            url: "https://github.com/surfstudio/surf-yandex-maps-ios-sdk/releases/download/4.10.1/YandexMapsMobile.xcframework.zip",
            checksum: "bd17d18812a548dfd9921487ec5ff3d326ee0a4ca6ea54cebab7478f06b85638"
        )
    ]
)
