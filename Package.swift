// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TanxSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "TanxSDK", targets: ["TanxSDK"]),
        .library(name: "TNXASDK", targets: ["TNXASDK"]),
        .library(name: "TanxMonitor", targets: ["TanxMonitor"])
    ],
    targets: [
        .binaryTarget(
            name: "TanxSDK",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.26/TanxSDK.xcframework.zip",
            checksum: "81e954ac61eabed29f345de7bf174d9b3bd76abf67311873505443ba61098d4c"
        ),
        .binaryTarget(
            name: "TNXASDK",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.26/TNXASDK.xcframework.zip",
            checksum: "62884545a12200f27c8abfc48224c1e5b8cbae427299af16a89fb6d0a1508737"
        ),
        .binaryTarget(
            name: "TanxMonitor",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.26/TanxMonitor.xcframework.zip",
            checksum: "4bfd677bfe9898cf31dac7bc68d4685d42abedbb2e551b48c6f16270f119ea71"
        )
    ]
)
