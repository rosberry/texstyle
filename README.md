# Texstyle

[![Build Status](https://travis-ci.org/rosberry/texstyle.svg?branch=master)](https://travis-ci.org/rosberry/texstyle)
[![Swift Version](https://img.shields.io/badge/swift-5.0-orange.svg)](https://swift.org/)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![codecov](https://codecov.io/gh/rosberry/texstyle/branch/master/graph/badge.svg)](https://codecov.io/gh/rosberry/texstyle)

Texstyle allows you to format attributed strings easily.

## Features

- Applying attributes with strong typing and autocompletion
- Cache for attributes
- Substyles
- Convenient extensions for `String` and `UIButton`

## Requirements

- iOS 9.0+ / tsOS 9.0+
- Xcode 10.0+

## Usage

```swift
let titleStyle = TextStyle()
titleStyle.font = .systemFont(ofSize: 15, weight: .bold)
titleStyle.lineHeight = 16

let text = Text(value: "Texstyle is awesome", style: titleStyle)
titleLabel.attributedText = text.attributed
```

Check TexstyleExample project for more examples.

## Installation

#### Carthage
Create a `Cartfile` that lists the framework and run `carthage update`. Follow the [instructions](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) to add the framework to your project.

```
github "rosberry/Texstyle"
```

#### Manually

Drag `Sources` folder from [last release](https://github.com/rosberry/Texstyle/releases) into your project.

## About

<img src="https://github.com/rosberry/Foundation/blob/master/Assets/full_logo.png?raw=true" height="100" />

This project is owned and maintained by [Rosberry](http://rosberry.com). We build mobile apps for users worldwide 🌏.

Check out our [open source projects](https://github.com/rosberry), read [our blog](https://medium.com/@Rosberry) or give us a high-five on 🐦 [@rosberryapps](http://twitter.com/RosberryApps).

## License

Texstyle is available under the MIT license. See the LICENSE file for more info.
