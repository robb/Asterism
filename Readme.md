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
});

ASTEach(@[ @"a", @"b", @"c" ], ^(NSString *letter, NSUInteger index) {
    NSLog(@"%u: %@", index, letter);
});

ASTEach(@{ @"foo": @"bar" }, ^(NSString *key, NSString *value) {
    NSLog(@"%@: %@", key, value);
});
```

[This page](http://robb.github.io/Asterism/) provides extensive documentation on
all of Asterism's methods.

Asterism was written by <a href="http://robb.is">Robert
Böhnke</a> and is <a href="http://opensource.org/licenses/MIT">MIT licensed</a>.
