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
            url: "https://github.com/surfstudio/surf-yandex-maps-ios-sdk/releases/download/4.3.1/YandexMapsMobile.xcframework.zip",
            checksum: "c66142a783a46845301192fd7dcc5f788f7707c6344e9ed919b58a7808f498c1"
        ),
    ]
)
