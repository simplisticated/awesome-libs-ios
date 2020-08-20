<p align="center" >
	<img src="/Images/logo_2048_2048.png" alt="Hammer" title="Hammer" width="300px" height="300px">
</p>

<p align="center">
	<a href="https://swift.org">
		<img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat">
	</a>
	<a href="https://cocoapods.org">
		<img src="https://img.shields.io/cocoapods/v/Hammer.svg">
	</a>
	<a href="https://cocoapods.org">
		<img src="https://img.shields.io/cocoapods/dt/Hammer.svg">
	</a>
	<a href="https://tldrlegal.com/license/mit-license">
		<img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat">
	</a>
</p>

## At a Glance

`Hammer` is a powerful tool for solving common tasks with classes and objects.

## How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `Hammer` cocoapod

## Requirements

* iOS 9 and later
* Xcode 9 and later
* Swift 4

## Usage

### Class Name

Retrieve class name:

```swift
let classNameWithNamespace = MainViewController.hmr.fullName     // "MyApplication.MainViewController"
let classNameWithoutNamespace = MainViewController.hmr.shortName // "MainViewController"
```

### Object Conversions

Use object in external closure:

```swift
let label = UILabel().hmr.use { (label) in
            label.text = "This is a label"
}.object
```

Use object converted to another type in external closure:

```swift
let view = SomeView().hmr.use(as: UILabel.self) { (label) in
    label.text = "This is a label"
}.object
```

### Object Retaining

Retain any object:

```swift
object.hmr.hold()
```

Release the object:

```swift
object.hmr.free()
```

### Container

Any object can be easily wrapped by special container:

```swift
let number: NSNumber? = nil

let container = number.hmr.wrap()
container.value // nil
container.isNil // true
```

### Just for Fun

You can replace any usage of `hmr` with hammer emoji:

```swift
let classNameWithNamespace = MainViewController.🔨.fullName
let classNameWithoutNamespace = MainViewController.🔨.shortName

let view = SomeView().🔨.use(as: UILabel.self) { (label) in
    label.text = "This is a label"
}.object

// etc.
```

## License

`Hammer` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
