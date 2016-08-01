![PromiseKit](http://promisekit.org/public/img/logo-tight.png)

Modern development is highly asynchronous: isn’t it about time we had tools that made programming asynchronously powerful, easy and delightful?

```swift
firstly {
    UIApplication.shared.networkActivityIndicatorVisible = true
}.then {
    when(fetchImage(), getLocation())
}.then { image, location in
    self.imageView.image = image;
    self.label.text = "Buy your cat a house in \(location)"
}.always {
    UIApplication.shared.networkActivityIndicatorVisible = false
}.catch { error in
    UIAlertView(/*…*/).show()
}
```

PromiseKit is a thoughtful and complete implementation of promises for iOS and macOS with first-class support for **both** Objective-C *and* Swift.

![](https://img.shields.io/cocoapods/v/PromiseKit.svg?label=Current%20Release)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/mxcl/PromiseKit.svg?branch=master)](https://travis-ci.org/mxcl/PromiseKit)

# Documentation

For a gentle but thorough introduction, [see promisekit.org](http://promisekit.org/docs/).

## Overview

Promises are defined by the function `then`:

```swift
login().then { json in
    //…
}
```

They are chainable:

```swift
login().then { json -> Promise<UIImage> in
    return fetchAvatar(json["username"])
}.then { avatarImage in
    self.imageView.image = avatarImage
}
```

Errors cascade through chains:

```swift
login().then {
    return fetchAvatar()
}.then { avatarImage in
    //…
}.catch { error in
    UIAlertView(/*…*/).show()
}
```

They are composable:

```swift
let username = login().then{ $0["username"] }

when(username, CLLocationManager.promise()).then { user, location in
    return fetchAvatar(user, location: location)
}.then { image in
    //…
}
```

They are trivial to refactor:

```swift
func avatar() -> Promise<UIImage> {
    let username = login().then{ $0["username"] }

    return when(username, CLLocationManager.promise()).then { user, location in
        return fetchAvatar(user, location: location)
    }
}
```

## Learn More

> [promisekit.org](http://promisekit.org/docs/)

# Getting Set Up

```ruby
#CocoaPods
pod "PromiseKit", "~> 4.0"

#Carthage
github "mxcl/PromiseKit" ~> 4.0
```

Alternatively, drop `PromiseKit.xcodeproj` into your project and add
`PromiseKit.framework` to your app’s “embedded frameworks”.

## PromiseKit vs. Xcode

PromiseKit contains Swift, so we engage in an unending battle with Xcode:

| Xcode | Swift | PromiseKit | Release Notes |
| ----- | ----- | ---------- | ------------- |
|   8   |  3.0  |      4     | [TODO](http://promisekit.org/news/) |
|   8   |  2.3  |      3     |   |
|   7   |  2.2  |      3     |   |
|   6   |  1.2  |      2     | [2015/05](http://localhost:4000/news/2015/05/PromiseKit-2.0-Released/) |
|   *   |  N/A  |      1     |   |

PromiseKit 1 is pure Objective-C and thus works with all Xcodes, it is also your only choice if you need to support iOS 7 or below.

---

We also maintain some branches to aid migrating between Swift versions:

| Xcode | Swift | PromiseKit | Branch |
| ----- | ----- | -----------| ---------------- |
|  7.3  |  2.2  | 2 | swift-2.2-minimal-changes |
|  7.2  |  2.2  | 2 | swift-2.2-minimal-changes |
|  7.1  |  2.1  | 2 | swift-2.0-minimal-changes |
|  7.0  |  2.0  | 2 | swift-2.0-minimal-changes |

We do **not** usually backport fixes to these branches, but pull-requests are welcome.

# Support

Ask your question on [Gitter](https://gitter.im/mxcl/PromiseKit) or
[our bug tracker](https://github.com/mxcl/PromiseKit/issues/new).
