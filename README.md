# DragonService
[![Build Status](https://travis-ci.org/WxWatch/DragonService.svg?branch=master)](https://travis-ci.org/WxWatch/DragonService)
![Cocoapods](https://img.shields.io/cocoapods/v/DragonService.svg)
![Cocoapods](https://img.shields.io/cocoapods/p/DragonService.svg)
![Cocoapods](https://img.shields.io/cocoapods/l/DragonService.svg)

DragonService is a Swift library to fetch data from Riot Games's DataDragon CDN.

## Requirements
- Swift 4.0+

## Installation
### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1+ is required to build DragonService.

To integrate DragonService into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'DragonService'
end
```

Then, run the following command:

```bash
$ pod install
```

## License

DragonService is released under the MIT license. [See LICENSE](https://github.com/WxWatch/DragonService/blob/master/LICENSE) for details.
