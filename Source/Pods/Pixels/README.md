<p align="center" >
<img src="https://github.com/igormatyushkin014/Pixels/blob/master/Images/logo_2048_2048.png" alt="Pixels" title="Pixels" width="300px" height="300px">
</p>

<p align="center">
<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/v/Pixels.svg"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/dt/Pixels.svg"></a>
<a href="https://tldrlegal.com/license/mit-license"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat"></a>
</p>

# Pixels

The purpose of `Pixels` library is to simplify common tasks with colors in iOS, which makes implementation of colorful UI designs easier. Absolutely compatible with native iOS SDK.

## How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `Pixels` cocoapod

## Requirements

* iOS 9 and later
* Xcode 9 and later
* Swift 4

## Usage

### Color Initialization

The common expression for color in RGB system is `#123456`. Another variety of this expression looks like `#123` which is equivalent to `#112233`. The same time, iOS SDK doesn't support those expressions above and requires to use `CGFloat` values for red, green, blue and alpha components in constructor of `UIColor` class. Not comfortable enough, right?

`Pixels` has a solution for the problem described above, so instead of this

```swift
let grayColor = UIColor(
    red: 51.0 / 255.0,
    green: 51.0 / 255.0,
    blue: 51.0,
    alpha: 255.0
)
```

you can simply write this

```swift
let grayColor = UIColor(hexString: "#333333") // RGB {51, 51, 51}
```

or this

```swift
let grayColor = UIColor(hexString: "#333") // RGB {51, 51, 51}
```

or even this

```swift
let grayColor = UIColor(hexString: "333") // RGB {51, 51, 51}
```

As you can see in last example, sharp symbol is optional. Hex string will be parsed correctly with or without sharp prefix.

`Pixels` supports both RGB and RGBA color systems, so you can also add alpha component to expression:

```swift
let grayColorWithSmallTransparency = UIColor(hexString: "#333333dd") // RGBA {51, 51, 51, 221}
let halfTransparentGrayColor = UIColor(hexString: "#3338") // RGBA {51, 51, 51, 136}
let almostTransparentGrayColor = UIColor(hexString: "#33333310") // RGBA {51, 51, 51, 16}
```

If hex string has wrong format, `nil` will be returned instead of `UIColor` instance.

### Operations with Color

With `Pixels` you can invert any color:

```swift
let invertedColor = UIColor.white.pxls
    .invertedColor(invertAlpha: false)
    .color // returns black color
```

Also, it's possible to mix two colors:

```swift
let mixedColor = UIColor.blue.pxls
    .mix(with: UIColor.orange)
    .color // returns purple color
```

All operations support chains, so you can use them like in example below:

```swift
let resultColor = UIColor.yellow.pxls
    .invertedColor(invertAlpha: false) // invert yellow color
    .mix(with: .orange)                // mix inverted color with orange
    .color                             // get `UIColor` instance
    .withAlphaComponent(0.5)           // make color 50% transparent
```

Every chain begins with `.pxls` and finishes by mentioning `.color` reference that generates final `UIColor` instance.

### Brand Colors

Sometimes you don't know which colors are good enough for your project. But you don't need to be a professional designer, because you can reuse popular color schemes used by well-known services. `Pixels` provides great collection of brand colors. All that you need is to write:

```swift
let color = UIColor.Brands.Google.blue
```

or 

```swift
let color = UIColor.Brands.Flickr.pink
```

Of course, you are not limited to make any operations with those colors:

```swift
let flickrPinkWithHalfTransparency = UIColor.Brands.Flickr.pink.colorWithAlphaComponent(0.5)
```

To see full collection of available brands, just type in Xcode `UIColor.Brands.` and you will see output like this:

<p align="center" >
<img src="https://github.com/igormatyushkin014/Pixels/blob/master/Images/available_brands.png" alt="Available Brands" title="Available Brands">
</p>

Another way to check available brands is to take a look at the [source code](Source/Extensions/Color/UIColorExtensionBrands.swift).

### HTML Colors

`Pixels` provides a list of [HTML colors](https://www.w3schools.com/colors/colors_names.asp). All of them are available in [`UIColor.HTML`](/Source/Resources/Colors/UIColorExtensionHTMLColors.swift) namespace:

```swift
let purple = UIColor.HTML.purple         // #800080
let orange = UIColor.HTML.orange         // #FFA500
let lightGreen = UIColor.HTML.lightGreen // #90EE90
```

### Google Material Colors

`Pixels` also includes set of material colors that can be used like in example below:

```swift
let orange = UIColor.Material.Orange._500
let blue = UIColor.Material.Blue.a200
// etc.
```

## License

`Pixels` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
