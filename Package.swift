// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libavif",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "libavif",
            targets: ["libavif"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "file:///Users/murakami/libdav1d", from: "0.0.4")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "libavif",
            dependencies: ["libdav1d"],
            path: "avif",
            exclude: ["src/codec_aom.c", "src/codec_rav1e.c", "src/codec_libgav1.c"],
            sources: ["src"],
            publicHeadersPath: "include",
            cSettings: [.define("AVIF_CODEC_DAV1D", to: "1")]
        )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)
