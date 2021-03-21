// swift-tools-version:5.1
import PackageDescription

let package = Package(
	name: "Cast",
	products: [
		.library(
			name: "Cast",
			targets: ["Cast"]
		),
	],
	targets: [
		.target(
			name: "Cast"
		),
		.testTarget(name: "CastTests", dependencies: ["Cast"]),
	]
)
