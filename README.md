# SABlurImageViewObjc

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-objc-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/SABlurImageViewObjc.svg?style=flat)](http://cocoapods.org/pods/SABlurImageView)
[![License](https://img.shields.io/cocoapods/l/SABlurImageViewObjc.svg?style=flat)](http://cocoapods.org/pods/SABlurImageView)

![](./SampleImage/sample.gif)

This is Objective-C version of [SABlurImageView](https://github.com/szk-atmosphere/SABlurImageView).

You can use blur effect and it's animation easily to call only two methods.

## Features

- [x] Blur effect with box size
- [x] Blur animation
- [x] 0.0 to 1.0 parameter blur

## Installation

#### CocoaPods

SABlurImageView is available through [CocoaPods](http://cocoapods.org). If you have cocoapods 0.36.0 or greater, you can install
it, simply add the following line to your Podfile:

    pod "SABlurImageViewObjc"

#### Manually

Add the [SABlurImageViewObjc](./SABlurImageViewObjc) directory to your project. 

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

You have to write `#import "SABlurImageView.h"`.

If you want to apply blur effect for image

```objective-c
	SABlurImageView *imageView = [[SABlurImageView alloc] initWithImage:image];
	[imageView addBlurEffect:30.0f times:1];	
```

If you want to animate

```objective-c
	SABlurImageView *imageView = [[SABlurImageView alloc] initWithImage:image];
	[imageView configrationForBlurAnimation:100.0f];
	[imageView startBlurAnimation:2.0f];
```

First time of blur animation is normal to blur. Second time is blur to normal. (automatically set configration of reverse animation)

If you want to use 0.0 to 1.0 parameter

```objective-c
	SABlurImageView *imageView = [[SABlurImageView alloc] initWithImage:image];
	[imageView configrationForBlurAnimation:100.0f];
	[imageView blur:0.5f];
```

## Installation

SABlurImageViewObjc is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SABlurImageViewObjc"
```
## Requirements

- Xcode 6.3 or greater
- iOS7.0(manually only) or greater
- QuartzCore
- Accelerate

## Author

Taiki Suzuki, s1180183@gmail.com

## License

SABlurImageView is available under the MIT license. See the LICENSE file for more info.
