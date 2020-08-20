<p align="center" >
	<img src="/Images/logo_2048_800.png" alt="Degree" title="Degree" width="50%" height="50%">
</p>

<p align="center">
	<a href="https://swift.org">
		<img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat">
	</a>
	<a href="https://cocoapods.org">
		<img src="https://img.shields.io/cocoapods/v/Degree.svg">
	</a>
	<a href="https://cocoapods.org">
		<img src="https://img.shields.io/cocoapods/dt/Degree.svg">
	</a>
	<a href="https://tldrlegal.com/license/mit-license">
		<img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat">
	</a>
</p>

## At a Glance

`Degree` is a tool for making gradient in Swift.

## How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `Degree` cocoapod

## Requirements

* iOS 9 and later
* Xcode 9 and later
* Swift 4

## Usage

Example of usage:

```swift
let gradientView = GradientView()
gradientView.gradient = Gradient.make
    .from(
        x: .left,
        y: .top
    )
    .to(
        x: .right,
        y: .bottom
    )
    .step(withColor: .white, andLocation: 0.0)
    .step(withColor: .orange, andLocation: 0.5)
    .step(withColor: .purple, andLocation: 1.0)
    .get
```

Each step is defined by its color and location, which is a `Float` value from `0.0` to `1.0`.

## License

`Degree` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
