# YandexMapsMobile, Lite version

Binary Framework as Swift Package with Yandex mobile maps (lite version).

🎉 Works on Apple silicone without Rosetta mode.

## Requirements

- iOS 12.0

## Swift Package Manager

To integrate YandexMapsMobile into your project using SwiftPM do this 👇🏻

- File > Swift Packages > Add Package Dependency
- Add `https://github.com/surfstudio/surf-yandex-maps-ios-sdk.git`
- Select "Up to Next Major" with "4.13.0"

or add the following code to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/surfstudio/surf-yandex-maps-ios-sdk", revision: "4.13.0"),
],
```
or via [XcodeGen](https://github.com/yonaskolb/XcodeGen) insert into your `project.yml`:

```yaml
name: YourProjectName
options:
  deploymentTarget:
    iOS: 12.0
packages:
  YandexMapsMobile:
    url: https://github.com/surfstudio/surf-yandex-maps-ios-sdk
    from: 4.13.0
targets:
  YourTarget:
    type: application
    ...
    dependencies:
       - package: YandexMapsMobile
```

## Recommedations to use

<details>
  <summary>Using on Apple silicon without Rosetta mode</summary>
  
1. You should init `YMKMapView` with `vulkanPreferred: true`
```swift
YMKMapView.init(frame: .zero, vulkanPreferred: isM1Simulator())

....

    #if targetEnvironment(simulator)
    public static func isM1Simulator() -> Bool {
        return TARGET_CPU_ARM64 != 0
    }
    #else
    public static func isM1Simulator() -> Bool { false }
    #endif

```

2. Call `YMKMapKit.sharedInstance()` in `AppDelegate` as in [example](https://github.com/yandex/mapkit-ios-demo/blob/master/MapKitDemo/AppDelegate.swift)

```swift
/**
If you create instance of YMKMapKit not in application:didFinishLaunchingWithOptions: 
you should also explicitly call YMKMapKit.sharedInstance().onStart()
*/
YMKMapKit.sharedInstance()
```

</details>

<details>
  <summary>YandexMapsMobile as subpackage</summary>

If you use `YandexMapsMobile` as subdependency in your own package you should probably add `linkerSettings` to the target for successful building:

```swift
targets: [
    .target(
        name: "Your target",
        dependencies: [
            .product(name: "YandexMapsMobile", package: "surf-yandex-maps-ios-sdk")
        ],
        linkerSettings: [ // <===== ‼️LOOK HERE‼️ 
            // same as described in https://github.com/CocoaPods/Specs/blob/master/Specs/d/d/0/YandexMapsMobile/4.10.1-lite/YandexMapsMobile.podspec.json
            .linkedFramework("CoreFoundation"),
            .linkedFramework("Foundation"),
            .linkedFramework("CoreLocation"),
            .linkedFramework("UIKit"),
            .linkedFramework("OpenGLES"),
            .linkedFramework("SystemConfiguration"),
            .linkedFramework("CoreGraphics"),
            .linkedFramework("QuartzCore"),
            .linkedFramework("Security"),
            .linkedFramework("CoreTelephony"),
            .linkedFramework("CoreMotion"),
            .linkedFramework("DeviceCheck"),
            .linkedLibrary("resolv"),
            .linkedLibrary("c++"),
            .unsafeFlags(["-ObjC"])
        ]),
]
```

</details>

## How to update version

- Find new realease of YandexMapsMobile [here](https://github.com/CocoaPods/Specs/tree/master/Specs/d/d/0/YandexMapsMobile)
- Unzip downloaded archive into `Input` folder (it's under gitignore)
- Rename `YandexMapsMobileLite.xcframework` to `YandexMapsMobile.xcframework` if needed
- Run `sh unpack_and_pack.sh` (checksum will be printed and zip will be placed in Output folder)
- Update versions and checksum in Readme and `Package.swift`
- Push and create new tag
- Create new Release at github page
- Add `xcframework.zip` from `Output` folder to release

## Special thanks

Based on work in this [repo](https://github.com/c-villain/YandexMapsMobile) ❤️