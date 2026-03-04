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
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.25/TanxSDK.xcframework.zip",
            checksum: "83dfe73e0fbecf0625c62de1f56b1e5d1f95c195a5489c0ed03cf5a03e81ba8f"
        ),
        .binaryTarget(
            name: "TNXASDK",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.25/TNXASDK.xcframework.zip",
            checksum: "996dd9bfa5471507d886eb288edc3c51281dd30c18d142b6aacef4f37ebe0962"
        ),
        .binaryTarget(
            name: "TanxMonitor",
            url: "https://github.com/RevinSun/TanxSDK-SPM/releases/download/3.7.25/TanxMonitor.xcframework.zip",
            checksum: "33a844611b614548c6ef5921ffb68cfc3001ecca8fdabdf4a570aa40579d6cac"
        )
    ]
)
