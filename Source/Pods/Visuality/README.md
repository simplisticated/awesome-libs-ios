<p align="center" >
  <img src="https://github.com/igormatyushkin014/Visuality/blob/master/Logo/logo_1024_1024.png" alt="Visuality" title="Visuality" width="300px" height="300px">
</p>

<p align="center">
<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/v/Visuality.svg?maxAge=2592000"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/dt/Visuality.svg?maxAge=2592000"></a>
<a href="https://tldrlegal.com/license/mit-license"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat"></a>
</p>

## At a Glance

Very often iOS developers face the problem of initializing view (or view controller) from NIB. Natively, iOS SDK requires developer to write a lot of code in this case:

1. check programmatically existence of bundle where the NIB file is stored ☹️
2. check existence of the NIB file inside of the bundle 😔
3. load content from the NIB 😠
4. find appropriate view from array of different elements 😡😡😡

`Visuality` provides a powerful solution for the problem described above. You can initialize view (and of course view controller) from NIB located in any bundle with just a one line of code! Sounds quite simple, isn't it? 😉

That's not all features available in `Visuality`. There's a lot more! 🚀

## How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `Visuality` cocoapod

## Requirements

* iOS 9 and later
* Xcode 9 and later
* Swift 4

## Usage

### Views

To create new `UIView` instance, you have to use `.from()` static method:

```swift
MyView.from(nib: <nib query>, inBundle: <bundle query>)
```

Nib query can be one of the following values:

- `byNibName("MyView")` - loads NIB with custom name
- `byClassName` - loads NIB with name of view class
- `byClassNameWithSuffix(<suffix>)` - loads NIB with name of view class and suffix
- `none` - loads view without NIB

List of available suffixes for NIB name:

- `_iPhone`
- `_iPad`
- `custom("suffix")`

Bundle query defines the bundle containing required NIB. Possible values are:

- `main` - main bundle
- `byInstance(bundle)` - requires instance of `Bundle` type
- `byIdentifier("com.example.App")` - requires bundle identifier

So, if you need to initialize a view of `MyView` type with same-named NIB file located in main bundle, you can simply write:

```swift
let view = MyView.from(nib: .byClassName, inBundle: .main)
```

### View Controllers

Initialization of view controller instances is very similar to view's initialization, but there's one more parameter:

```swift
let viewController = MyViewController.from(nib: .byClassName, inBundle: .main, loadView: true)
```

The last parameter `loadView` is a boolean value defining whether view should be loaded immediately after view controller's instantiation. In most cases you don't need to load view immediately, but, sometimes, this is a quite helpful option.

By default, `loadView` is `false`, so, if you don't need to load view controller's view immediately, you can avoid mentioning this parameter:

```swift
let viewController = MyViewController.from(nib: .byClassName, inBundle: .main)
```

In this case view will be loaded right before displaying on the screen.

## License

`Visuality` is available under the MIT license. See the `LICENSE` file for more info.
