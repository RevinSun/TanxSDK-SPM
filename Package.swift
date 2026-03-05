// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TanxSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // 对外只暴露 Wrapper（它依赖二进制 TanxSDK + 携带资源）
        .library(name: "TanxSDK", targets: ["TanxSDKWrapper"]),
        .library(name: "TNXASDK", targets: ["TNXASDK"]),
        .library(name: "TanxMonitor", targets: ["TanxMonitor"])
    ],
    targets: [
        .binaryTarget(
            name: "TanxSDKBinary",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.27/TanxSDK.xcframework.zip",
            checksum: "81e954ac61eabed29f345de7bf174d9b3bd76abf67311873505443ba61098d4c"
        ),
        .binaryTarget(
            name: "TNXASDK",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.27/TNXASDK.xcframework.zip",
            checksum: "62884545a12200f27c8abfc48224c1e5b8cbae427299af16a89fb6d0a1508737"
        ),
        .binaryTarget(
            name: "TanxMonitor",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.27/TanxMonitor.xcframework.zip",
            checksum: "4bfd677bfe9898cf31dac7bc68d4685d42abedbb2e551b48c6f16270f119ea71"
        ),

        // Wrapper：用于携带资源（TanxID.bundle）并依赖二进制 TanxSDK
        .target(
            name: "TanxSDKWrapper",
            dependencies: [
                "TanxSDKBinary",
                "TNXASDK",
                "TanxMonitor"
            ],
            path: "Sources/TanxSDKWrapper",
            resources: [
                .copy("Resources/TanxID.bundle")
            ]
        )
    ]
)
