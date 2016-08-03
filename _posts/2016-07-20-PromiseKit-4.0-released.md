---
layout: default
title: PromiseKit 4.0 Released
---

# PromiseKit 4.0 Released

Notable changes:

### Minimum Deployment Target

* PromiseKit now requires a deployment target >= macOS 10.10, the deployment targets for iOS, watchOS and tvOS are unchanged.

### `catch` Returns

* Swift 3 now allows keywords to be used as member functions, so thankfully we have restored `catch`.

### Initializer Changes

* We have moved all initializers except `Promise { fulfill, reject in }` to class methods to prevent ambiguity in usage and make the compiler happy for the 90% use case.

### `recover` Behavior Change
* `recover` now takes a `CatchPolicy` which means it **by default** no longer “catches” cancellation errors, you should vet any use of `recover`. Probably this is actually what you wanted all along.

### `@import PromiseKit;` works

* You can now `@import PromiseKit;`, before this wouldn’t import the whole library in an effort to prevent Swift and ObjC seeing the parts of PromiseKit designed for the other. We now properly use `NS_REFINED_FOR_SWIFT` et al. and thus the build-system manages symbol visibility for us.

### `Error.when` Removed

https://github.com/mxcl/PromiseKit/issues/341

### `join()` Behavior Change

Your old joins won't compile, so you’ll notice this change for sure.

## New Features

* `PMKSetDefaultDispatchHandler`
