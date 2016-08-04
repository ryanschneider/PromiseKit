---
layout: docs
title: Cocoa+Promise
redirect_from:
 - "/api/"
 - "/pods/"
---

# Cocoa+Promise

We provide wrappers for almost all the asynchronous functionality provided by Apple. For example:

```swift
CLLocationManager.promise().then { location in
    //…
}

MKDirections(/*…*/).promise().then { directionsResponse in
    //…
}
```

> [View our full extensions listing on GitHub](https://github.com/mxcl/PromiseKit/tree/master/Categories) or below.

---

Our `NSURLSession` and `NSURLConnection` extensions allow you to choose the decoded output type:

```swift
NSURLSession.GET(url).then { data -> Void in
    // by default you just get the raw `Data`
}

NSURLSession.GET(url).asDictionary().then { json -> Void in
    // call `asDictionary()` to have the result decoded
    // as JSON with the result being an `NSDictionary`
    // the promise is rejected if the JSON can not be
    // decoded or the resulting object is not a dictionary
}

NSURLSession.GET(url).asArray().then { json -> Void in
    // json: NSArray
}

NSURLSession.GET(url).asString().then { string -> Void in
    // string: String
}
```

They also support `POST`, `PUT`, etc.

---

For convenience, we also provide:

* [A promise that resolves when there is a valid Internet connection](https://github.com/mxcl/PromiseKit/blob/master/Categories/SystemConfiguration/SCNetworkReachability+AnyPromise.h).
* [A promise that resolves when an object deallocates](https://github.com/mxcl/PromiseKit/blob/master/Categories/Foundation/afterlife.swift).

In addition, PromiseKit is designed so that promises can be provided by other third-party libraries.

* [CocoaPods that use PromiseKit](https://cocoapods.org/?q=uses%3Apromisekit*)

## Use With Carthage

To use these categories with Carthage you must 

## Complete Cocoa Extensions Listing

We aim to provide a promise for all asynchronous operations in the Apple SDKs:

* `ACAccountStore`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/Accounts/ACAccountStore+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/Accounts/ACAccountStore+Promise.swift)
* `AddressBook`
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/AddressBook/ABAddressBookRequestAccess+Promise.swift)
* `AVAudioSession`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/AVFoundation/AVAudioSession+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/AVFoundation/AVAudioSession+Promise.swift)
* `CKContainer`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/CloudKit/CKContainer+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/CloudKit/CKContainer+Promise.swift)
* `CKDatabase`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/CloudKit/CKDatabase+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/CloudKit/CKDatabase+Promise.swift)
* `CLGeocoder`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/CoreLocation/CLGeocoder+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/CoreLocation/CLGeocoder+Promise.swift)
* `CLLocationManager`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/CoreLocation/CLLocationManager+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/CoreLocation/CLLocationManager+Promise.swift)
* `NSNotificationCenter`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/Foundation/NSNotificationCenter+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/Foundation/NSNotificationCenter+Promise.swift)
* Key-Value-Observation (KVO)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/Foundation/NSObject+Promise.swift)
* `NSTask`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/Foundation/NSTask+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/Foundation/NSTask+Promise.swift)
* `NSURLConnection`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/Foundation/NSURLConnection+AnyPromise.h)
    The Objective-C version is powerful; it determines, decodes and `thens` the rich data type based on the HTTP response headers.
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/Foundation/NSURLConnection+Promise.swift)
    The Swift version is strict, if you want the response to be decoded as JSON, you must speciailize your then as `NSDictionary`.
* `NSURLSession`
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/Foundation/NSURLSession+Promise.swift)
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/Foundation/NSURLSession+AnyPromise.m)
* `MKDirections`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/MapKit/MKDirections+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/MapKit/MKDirections+Promise.swift)
* `MKMapSnapshotter`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/MapKit/MKMapSnapshotter+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/MapKit/MKMapSnapshotter+Promise.swift)
* `MFMessageComposeViewController`<br>
  Present a message composer and `then` after user-action. No delegation required.
  * For Objective-C, use UIViewController’s `promiseViewController` method.
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/MessagesUI/MFMessageComposeViewController+Promise.swift)
* `MFMailComposeViewController`<br>
  Present a mail composer and `then` after user-action. No delegation required.
  * For Objective-C, use UIViewController’s `promiseViewController` method.
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/MessagesUI/MFMailComposeViewController+Promise.swift)
* `PHPhotoLibrary`
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/Photos/PHPhotoLibrary+Promise.swift)
* `CoreAnimation`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/QuartzCore/CALayer+AnyPromise.h)
* `SLComposeViewController`<br>
  Presents a social share sheet and `then` after user-action.
  * [SLComposeViewController+Promise.swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/Social/SLComposeViewController+Promise.swift)
* `SLRequest`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/Social/SLRequest+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/Social/SLRequest+Promise.swift)
* `StoreKit`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/StoreKit/SKRequest+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/StoreKit/SKRequest+Promise.swift)
* `UIAlertController`
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/UIKit/PMKAlertController.swift)
* `UIActionSheet`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/UIKit/UIActionSheet+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/UIKit/UIActionSheet+Promise.swift)
* `UIAlertView`
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/UIKit/UIAlertView+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/UIKit/UIAlertView+Promise.swift)
* `UIView` Animation
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/UIKit/UIView+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/UIKit/UIView+Promise.swift)
* `UIImagePickerController`<br>
  Present a picker and `then` the user’s selected image.
  * NSData: [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/AssetsLibrary/ALAssetsLibrary+Promise.swift)
  * UIImage: [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/UIKit/UIViewController+AnyPromise.h)
* `UIViewController`<br>
  Present a custom view controller and `then` when the controller is dismissed.
  * [Objective-C](https://github.com/mxcl/PromiseKit/blob/master/Categories/UIKit/UIViewController+AnyPromise.h)
  * [Swift](https://github.com/mxcl/PromiseKit/blob/master/Categories/UIKit/UIViewController+Promise.swift)
