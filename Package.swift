// swift-tools-version:4.2

import PackageDescription

let package = Package(
  name: "CompilerCrasherAutoclosureSubscript",
  products: [
    .library(name: "S", targets: ["S"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(name: "S"),
    .testTarget(name: "STests", dependencies: ["S"]),
  ]
)
