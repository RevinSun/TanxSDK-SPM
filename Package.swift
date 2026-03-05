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
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.32/TanxSDK.xcframework.zip",
            checksum: "be88e23dc272b129a8fc0e5d7cdfa7334f9d79e3fe020d12333b34fd13f06e02"
        ),
        .binaryTarget(
            name: "TNXASDK",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.32/TNXASDK.xcframework.zip",
            checksum: "7dc8777e5bafe78f9d6141fc8a248e1c4d59b7df0260a07f862898caa62a2571"
        ),
        .binaryTarget(
            name: "TanxMonitor",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.32/TanxMonitor.xcframework.zip",
            checksum: "dedc8bedbd7608ade190a00974e9c0b43ed2b213c79ee012e84061435bbaab90"
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
                .process("TanxID.bundle")
            ]
        )
    ]
)
