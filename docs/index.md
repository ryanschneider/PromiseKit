---
layout: docs
title: Fundamentals
nav: Docs
order: 2
redirect_from:
 - "/then/"
 - "/chaining/"
 - "/introduction/"
 - "/error-handling/"
 - "/when/"
 - "/finally/"
 - "/recovering-from-errors/"
---

# The Fundamentals of Promises

> Documentation is for (not yet current) PromiseKit 4, sorry. Most things are
> the same or very similar. Maintaining two sets of documentation is not
> possible for this one-man band. Thank you for your patience.

A promise is an object that represents an asynchronous task. Pass that object around, and write clean, ordered code; a logical, simple, modular stream of progression from one asynchronous task to another.

`then` is like a completion-handler, but for promises:

```swift
PHPhotoLibrary.requestAuthorization().then { authorized in
    print(authorized)  // => true or false
}
```

Promises separate error handling from your main code path; just like Swift:

```swift
PHPhotoLibrary.requestAuthorization().then { authorized -> Void in
    guard authorized else { throw MyError.unauthorized }
    // …
}.catch { error in
    UIAlertView(/*…*/).show()
}
```

Which is particularly useful because errors jump to the `catch`; just like swift:

```swift
PHPhotoLibrary.requestAuthorization().then { authorized -> Promise in

    guard authorized else { throw MyError.unauthorized }
        
    // returning a promise in a `then` handler waits on that
    // promise before continuing to the next handler
    return CLLocationManager.promise()
    
    // if the above promise fails, execution jumps to the catch below

}.then { location -> Void in
    
    // if anything throws in this handler execution also jumps to the `catch`

}.catch { error in
    switch error {
    case MyError.unauthorized:
        //…
    case is CLError:
        //…
    }
}
```

Promises standardize the interfaces of asynchronicity; the take home is things that are tedious and flakey with completion-handlers are delightful with promises:

```swift
let network = NSURLSession.GET(url)
let locater = CLLocationManager.promise()

when(fulfilled: network, locater).then { data, location in
   // both tasks suceeded!
}.catch { error in
    // at least one of the tasks failed
}
```

Asynchronous state machines can be nightmares, but less so with promises:

```swift
firstly {

    UIApplication.shared.networkActivityIndicatorVisible = true    
    //NOTE: we _must_ remember to unset the activity indicator
    
}.then { _ -> Promise in
    let network = NSURLSession.GET(url)
    let locater = CLLocationManager.promise()    
    return when(fulfilled: network, locater)
}.then { data, location -> Void in
    //…
}.always {

    //NOTE: oh right, promises make this easy    
    UIApplication.shared.networkActivityIndicatorVisible = false

}.catch { error in
    //…
}
```

<aside>
The above logic only continues if all promises succeed, if any promise fails
then the when immediately stops and execution continues at the next <code>catch</code>.
Thus we also provide <code>when(resolved:)</code>, which waits for all promises
even if some fail. <b>Usually you want <code>when(fulfilled:)</code></b>.
</aside>

<br>
Error handling in Cocoa is hard to do well, but promises make it easy, and they make what is normally tricky edge-case error handling easy too:

```swift
CLLocationManager.promise().recover { error -> CLLocation in
    
    // `recover` allows you to recover from errors
    // in this closure you can inspect the error and either
    // throw the error again, thus rejecting the chain or
    // instead return a valid value
    
    guard error == CLLocationError.NotFound else { throw error }
    return CLLocation.chicago

}.then { location in
    //…
}.catch { error in
    // errors OTHER than CLLocationError.NotFound
}
```

PromiseKit has the concept of <b><i>cancellation</i></b> baked in. If the user cancels something then typically you don't want to continue a promise chain, but you don't want to show an error message either. So what is cancellation? It's not success and it's not failure, but it should handle more like an error, ie. it should skip all the subsequent `then` handlers. PromiseKit embodies cancellation as a special kind of error:

```swift
firstly {
    UIApplication.shared.networkActivityIndicatorVisible = true
}.then {
    return CLLocationManager.promise()
}.then { location in
    let alert = UIAlertView()
    alert.addButton(title: "Proceed!")
    alert.addButton(title: "Proceed, but fastest!")
    alert.cencelButtonIndex = alert.addButton("Cancel")
    return alert.promise()
}.then { dismissedButtonIndex in
    //… cancel wasn't pressed
}.always {
    UIApplication.shared.networkActivityIndicatorVisible = false
}.catch { error in
    //… cancel wasn't pressed
}
```

The above works like you want, if the user presses the cancel button in the alert view the `networkActivityIndicator` is unset but otherwise nothing happens.

If you need to handle cancellation however, you can:

```swift
NSURLSession.shared.promise(url: myUrl).then { data in
    // NSURLSession can be cancelled via the `cancel` method
}.catch(policy: .allErrors) { error in
    if error.isCancelledError {
        // something called “cancel” on the session object
    } else {
        // some other error occurred
    }
}
```

Because `then` is just a function you call on an object, you can call it multiple times:

```swift
let directionsPromise = MKDirections(/*…*/).promise()
directionsPromise.then { print(1) }
directionsPromise.then { print(2) }
```

The closures you pass are executed in order — once the directions have come back from Apple’s servers.

## Further Reading

* [https://littlebitesofcocoa.com/13-promisekit]()
* [https://medium.com/the-traveled-ios-developers-guide/making-promises-417f13da901f]()
* [http://samwize.com/2015/04/17/guide-to-using-promisekit/]()
