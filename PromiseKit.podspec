Pod::Spec.new do |s|
  s.name = "PromiseKit"

  `xcodebuild -project PromiseKit.xcodeproj -showBuildSettings` =~ /CURRENT_PROJECT_VERSION = ((\d\.)+\d)/
  abort("No version detected") if $1.nil?
  s.version = $1

  s.source = { :git => "https://github.com/mxcl/#{s.name}.git", :tag => s.version }
  s.license = 'MIT'
  s.summary = 'A delightful Promises implementation for iOS and OS X.'
  s.homepage = 'http://promisekit.org'
  s.description = 'A thoughtful and complete implementation of promises for iOS and macOS with first-class support for both Objective-C and Swift.'
  s.social_media_url = 'https://twitter.com/mxcl'
  s.authors  = { 'Max Howell' => 'mxcl@me.com' }
  s.documentation_url = 'http://promisekit.org/docs/'
  s.default_subspecs = 'Foundation', 'UIKit', 'QuartzCore'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.module_map = 'PromiseKit.modulemap'
  s.xcconfig = { 'SWIFT_INSTALL_OBJC_HEADER' => 'NO' }

  s.subspec 'Accounts' do |ss|
    ss.ios.source_files = ss.osx.source_files = 'Categories/Accounts/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'Accounts'
  end

  s.subspec 'AddressBook' do |ss|
    ss.ios.source_files = 'Categories/AddressBook/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.frameworks = 'AddressBook'
  end

  s.subspec 'Alamofire' do |ss|
    ss.source_files = 'Categories/Alamofire/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.dependency 'Alamofire', 'swift3'
  end

  s.subspec 'AssetsLibrary' do |ss|
    ss.ios.source_files = 'Categories/AssetsLibrary/*'
    ss.dependency 'PromiseKit/UIKit'
    ss.ios.frameworks = 'AssetsLibrary'
  end

  s.subspec 'AVFoundation' do |ss|
    ss.ios.source_files = 'Categories/AVFoundation/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.frameworks = 'AVFoundation'
  end

  s.subspec 'Bolts' do |ss|
    ss.source_files = 'Categories/Bolts/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.dependency 'Bolts', '~> 1.6.0'
  end

  s.subspec 'CloudKit' do |ss|
    ss.source_files = 'Categories/CloudKit/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'CloudKit'
    ss.ios.deployment_target = '8.0'
    ss.osx.deployment_target = '10.10'
  end

  s.subspec 'CoreBluetooth' do |ss|
    ss.ios.source_files = ss.osx.source_files = 'Categories/CoreBluetooth/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'CoreBluetooth'
  end

  s.subspec 'CorePromise' do |ss|
    hh = Dir['Sources/*.h'] - Dir['Sources/*+Private.h']
    
    ss.source_files = 'Sources/*.{swift}', 'Sources/{after,AnyPromise,GlobalState,dispatch_promise,hang,join,PMKPromise,when}.m', *hh
    ss.public_header_files = hh
    ss.preserve_paths = 'Sources/AnyPromise+Private.h', 'Sources/PMKCallVariadicBlock.m', 'Sources/NSMethodSignatureForBlock.m'
    ss.frameworks = 'Foundation'
  end

  s.subspec 'CoreLocation' do |ss|
    ss.ios.source_files = 'Categories/CoreLocation/*'
    ss.osx.source_files = 'Categories/CoreLocation/*'
    ss.watchos.source_files = Dir['*/CLGeocoder*']
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'CoreLocation'
  end

  s.subspec 'EventKit' do |ss|
    ss.ios.source_files = 'Categories/EventKit/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.frameworks = 'EventKit'
  end
  
  s.subspec 'Foundation' do |ss|
    deprecated_files = Dir['Categories/Foundation/NSURLConnection*']
    base_files =  Dir['Categories/Foundation/*'] - deprecated_files
    nstask_files = Dir['Categories/Foundation/NSTask*']
  
    ss.ios.source_files = base_files - nstask_files
    ss.osx.source_files = base_files
    ss.watchos.source_files = base_files - nstask_files

    ss.dependency 'PromiseKit/CorePromise'
    ss.dependency 'OMGHTTPURLRQ', '~> 3.2.0'
    ss.frameworks = 'Foundation'
    
    ss.subspec 'Deprecated' do |sss|
      sss.source_files = deprecated_files
      sss.frameworks = 'Foundation'
    end
  end
  
  s.subspec 'DietFoundation' do |ss|
    ss.ios.source_files = Dir['Categories/Foundation/*'] - Dir['Categories/Foundation/NSTask*', 'Categories/Foundation/NSURL*']
    ss.osx.source_files = Dir['Categories/Foundation/*'] - Dir['Categories/Foundation/NSURL*']
    ss.watchos.source_files = Dir['Categories/Foundation/*'] - Dir['Categories/Foundation/NSTask*', 'Categories/Foundation/NSURL*']
    
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'Foundation'
  end

  s.subspec 'MapKit' do |ss|
    ss.ios.source_files = 'Categories/MapKit/*'
    ss.osx.source_files = 'Categories/MapKit/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'MapKit'
  end

  s.subspec 'MessageUI' do |ss|
    ss.ios.source_files = 'Categories/MessageUI/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.frameworks = 'MessageUI'
  end

  s.subspec 'Photos' do |ss|
    ss.ios.source_files = 'Categories/Photos/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.frameworks = 'Photos'
  end

  s.subspec 'QuartzCore' do |ss|
    ss.ios.source_files = 'Categories/QuartzCore/*'
	ss.osx.source_files = 'Categories/QuartzCore/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'QuartzCore'
  end

  s.subspec 'Social' do |ss|
    ss.ios.source_files = 'Categories/Social/*'
    ss.osx.source_files = Dir['Categories/Social/*'] - ['Categories/Social/SLComposeViewController+Promise.swift']
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'Social'
  end

  s.subspec 'StoreKit' do |ss|
    ss.ios.source_files = ss.osx.source_files = ss.tvos.source_files = 'Categories/StoreKit/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'StoreKit'
  end

  s.subspec 'SystemConfiguration' do |ss|
    ss.ios.source_files = ss.osx.source_files = 'Categories/SystemConfiguration/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'SystemConfiguration'
  end

  s.subspec 'UIKit' do |ss|
    deprecated_files = Dir['Categories/UIKit/UIActionSheet*', 'Categories/UIKit/UIAlertView*']
    
    ss.ios.source_files = Dir['Categories/UIKit/*'] - deprecated_files
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.frameworks = 'UIKit'
    
    ss.subspec 'Deprecated' do |sss|
      sss.ios.source_files = deprecated_files
      sss.ios.frameworks = 'UIKit'
    end
  end

  s.subspec 'WatchConnectivity' do |ss|
    ss.source_files = 'Categories/WatchConnectivity/*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'WatchConnectivity'
    ss.ios.deployment_target = '8.0' # Watch Connectivity only works in iOS 9 but apps with a deployment target of 8.0 can still include it because of the availability check
    ss.watchos.deployment_target = '2.0'
  end
end
