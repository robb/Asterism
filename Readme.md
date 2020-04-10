# Asterism ⁂

<a href="https://travis-ci.org/robb/Asterism?branch=master">
    <img src="https://travis-ci.org/robb/Asterism.svg?branch=master" align="right" vspace="2px">
</a>

Asterism is yet another functional toolbelt for Objective-C. It tries to be
typesafe and simple.

Using common higher-order functions such as `map`, `reduce` and `filter`,
Asterism allows you to manipulate Foundation's data structures with ease.

It makes use of overloaded C-Functions to keep its interface simple while
maintaining compile-time safety. For instance, `ASTEach` takes different blocks
depending on the data structure it operates on:

```objective-c
ASTEach(@[ @"a", @"b", @"c" ], ^(NSString *letter) {
    NSLog(@"%@", letter);
}];

ASTEach(@[ @"a", @"b", @"c" ], ^(NSString *letter, NSUInteger index) {
    NSLog(@"%u: %@", index, letter);
}];

ASTEach(@{ @"foo": @"bar" }, ^(NSString *key, NSString *value) {
    NSLog(@"%@: %@", key, value);
}];
```

[This page](http://robb.github.io/Asterism/) provides extensive documentation on
all of Asterism's methods.

Asterism was written by <a href="http://robb.is">Robert
Böhnke</a> and is <a href="http://opensource.org/licenses/MIT">MIT licensed</a>.

==============================

## Getting Started

### Using Carthage
Install [Carthage](https://github.com/Carthage/Carthage) if you don't have it. The easiest way is to use [HomeBrew](http://brew.sh):
     `brew update`
     `brew install carthage`
      (or if you already have it installed) `brew upgrade carthage`

Create a [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#example-cartfile) at the root directory of your project and add the following to its contents...

 ```
 github 'robb/Asterism'
 ```

Run Carthage...

 ```sh
 carthage update
 ```
 
##### If you're building for OS X

On your application targets’ “General” settings tab, in the “Embedded Binaries” section, drag and drop the Asterism.framework from the `Carthage/Build/Mac` folder.

Additionally, you'll need to copy debug symbols for debugging and crash reporting on OS X.

1. On your application target’s “Build Phases” settings tab, click the “+” icon and choose “New Copy Files Phase”.
2. Click the “Destination” drop-down menu and select “Products Directory”.
3. Now drag and drop the Asterism.framework's corresponding dSYM file.

##### If you're building for iOS

On your application targets’ “General” settings tab, in the “Linked Frameworks and Libraries” section, drag and drop the Asterism.framework from the `Carthage/Build/iOS` folder.

On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase”. Create a Run Script in which you specify your shell (ex: `bin/sh`), add the following contents to the script area below the shell:

  ```
  /usr/local/bin/carthage copy-frameworks
  ```

  and add the path to the Asterism.framework under “Input Files”, e.g.:

  ```
  $(SRCROOT)/Carthage/Build/iOS/Asterism.framework
  ```
  For a more detailed background of this script and it's intent, see the [Carthage readme](https://github.com/Carthage/Carthage/blob/master/README.md#if-youre-building-for-ios-tvos-or-watchos).
  
### Using CocoaPods
First, update CocoaPods if you haven't in a while.

Then, add Asterism to your Podfile. Be sure to include ```use_frameworks!```:

```rb
# Podfile

use_frameworks!

target 'My-OSX-App' do
    platform :osx, '10.9'
    
    pod 'Asterism'
end

target 'My-iOS-App' do
    platform :iOS, '9.2'
    
    pod 'Asterism'
end
```

Finally, tell Cocopods to download and link Asterism in your project:

```sh
pod install
```

### Using the Amalgamation header/source file pair
Checkout this repo at the version you desire.

```sh
script/gen_amalgamation.sh

cp Amalgamation/* <PathToYourProjectSourcesHere>
```

And just add the `.m` file to the targets you desire and `#import "Asterism.h"` when you use it or in your `.pch`


