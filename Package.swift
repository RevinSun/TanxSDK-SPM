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
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.35/TanxSDK.xcframework.zip",
            checksum: "08514ad94b2caf5bf2606249af9efbf9158f7c7e75a60b59234821aa9505ecae"
        ),
        .binaryTarget(
            name: "TNXASDK",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.35/TNXASDK.xcframework.zip",
            checksum: "2244c9254ac23c8ceb4575323347050926c76317aef9d41bbfbb3fb598f07727"
        ),
        .binaryTarget(
            name: "TanxMonitor",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.35/TanxMonitor.xcframework.zip",
            checksum: "eebf321c0c27aa76991e7cbbdab3a668cfa5bc30476cdf2ce0cb408db89eef60"
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
