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
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.34/TanxSDK.xcframework.zip",
            checksum: "62fef69e18ec5c077de82f6e2dacef02aa97de129edc85ac5c11c8727521b4ab"
        ),
        .binaryTarget(
            name: "TNXASDK",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.34/TNXASDK.xcframework.zip",
            checksum: "f61a33ce921f29a75e58be071c36c71129f97a793161bc8f1d4eaf313c14a8cf"
        ),
        .binaryTarget(
            name: "TanxMonitor",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.34/TanxMonitor.xcframework.zip",
            checksum: "9a4ae132494f8200ef4b553b51fddfe587353c070c92794934f3d72af28855fb"
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
