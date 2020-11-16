// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "KeychainSimpleStore",
  platforms: [.iOS(.v14), .macOS(.v11), .watchOS(.v6), .tvOS(.v14)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "KeychainSimpleStore",
      type: .dynamic,
      targets: ["KeychainSimpleStore"])],
  dependencies: [
    .package(
      url: "https://github.com/kishikawakatsumi/KeychainAccess.git",
      from: "4.2.1")],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "KeychainSimpleStore",
      dependencies: ["KeychainAccess"]),
    .testTarget(
      name: "KeychainSimpleStoreTests",
      dependencies: ["KeychainSimpleStore", "KeychainAccess"]),
  ]
)
