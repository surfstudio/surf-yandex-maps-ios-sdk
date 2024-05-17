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
            url: "https://github.com/surfstudio/surf-yandex-maps-ios-sdk/releases/download/4.5.2/YandexMapsMobile.xcframework.zip",
            checksum: "4e397bf3a520301a4ac743aef3d3d2c7e868c95b617e8f8a8767b0710a7fa1e7"
        ),
    ]
)
