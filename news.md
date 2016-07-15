---
layout: default
title: News
nav: News
order: 4
---

# Announcements

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>

# Older News

<h3>PromiseKit 3.2.1 <small style='color:rgba(0,0,0,0.5)'>Jul 10th, 2016</small></h3>
<p>Critical fix for archiving projects using our NSNotificationCenter Swift extension as well as additional fixes from the community.</p>

<h3>PromiseKit 3.2.0 <small style='color:rgba(0,0,0,0.5)'>May 20th, 2016</small></h3>
<p>• A new EventKit category<br>
• Ability to change the global queue for promises<br>
• Ability to define a custom queue for <code>`error`</code><br>
• Documentation and other various fixes</p>

<h3>PromiseKit 3.1.1 <small style='color:rgba(0,0,0,0.5)'>Apr 6th, 2016</small></h3>
<p>• Temporary aliases to disambiguate <code>`error`</code> the property and function<br>
• Fix for edge cases when dismissing a promised view controller<br>
• Various minor fixes</p>

<h3>PromiseKit 3.1.0 <small style='color:rgba(0,0,0,0.5)'>Mar 26th, 2016</small></h3>
<p>Swift 2.2 support plus <a href="https://github.com/mxcl/PromiseKit/commit/45cc049c3fd045ae32064bd164798b46d02ab5e4">additional improvements from the community</a>.</p>

<h3>PromiseKit 3.0.3 <small style='color:rgba(0,0,0,0.5)'>Feb 29th, 2016</small></h3>
<p>AnyPromise bridging to NSString and objc BOOL plus <a href="https://github.com/mxcl/PromiseKit/commit/2382da78e7aad8de7ea4b253d13c1416c7f4c53b">additional improvements from the community</a>.</p>

<h3>PromiseKit 3.0.2 <small style='color:rgba(0,0,0,0.5)'>Jan 31st, 2016</small></h3>
<p>tvOS support</p>

<h3>PromiseKit 3.0.1 <small style='color:rgba(0,0,0,0.5)'>Jan 14th, 2016</small></h3>
<p>Minor fixes and improvements from the community.</p>

<h3>PromiseKit 3.0 <small style='color:rgba(0,0,0,0.5)'>Oct 1st, 2015</small></h3>
<p>Includes <a href="https://github.com/mxcl/PromiseKit#promisekit-3">Swift 2.0 compatibility and minor improvements</a>. With this release, the library is now in maitenance mode.</p>

<h3>PromiseKit 2.0 <small style='color:rgba(0,0,0,0.5)'>May 14th, 2015</small></h3>
<p>PromiseKit 2.0 is here with <a href="/PromiseKit-2.0-Released">many important and interesting additions</a>.</p>

<h3>PromiseKit 1.5.0</h3>
<p>Swift 1.2 support. Xcode 6.3 required.</p>
  
<h3>PromiseKit 1.4.1</h3>
<p>Added a <code>race()</code> function to the Swift branch. Improved the
zalgoness of <code>thenUnleashZalgo()</code>. Split the Swift CocoaPods out
so it is completely modular like the objc version.</p>

<h3>PromiseKit 1.4.0</h3>
<p>Fixes abound. An additional set of features is a series of new constructors
designed to make wrapping existing asynchronous systems easier. Check out
<code>promiseWithAdapter</code> and company at <a href="http://cocoadocs.org/docsets/PromiseKit/1.4.0/">cocoadocs.org</a>
</p>

<h3 style='margin-top: 0.2em'>Swift 1.2 Support</h3>
<p>A Swift-1.2 branch has been created for Xcode 6.3-beta2 support. Swift support
is still not 100% great, but when 6.3 properly releases we hope to clean up the
remaining tickets and announce that it is ready for hassle-free use. Please note,
it is production ready, it's just the code you write is not as great as we'd like.
</p>

<h3>PromiseKit 1.3.1</h3>
<p>The 1.3.1 tag has been pushed, but only for Carthage users. CocoaPods will skip
  this version most likely with a 1.3.2 release in the near future.
</p>
