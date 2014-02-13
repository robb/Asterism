//
//  ASTMap.h
//  Asterism
//
//  Created by Robert Böhnke on 5/22/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Maps a block across an array.
//
// array - An array of elements.
// block - A block that takes an element as its only argument and returns a new
//         element. The block must not be nil.
//
// Returns an array that contains all values of `array` after `block` has been
// applied. If `block` returns `nil`, the element is not present in the returned
// array. The order is being maintained.
OVERLOADABLE NSArray *ASTMap(NSArray *array, id(^block)(id obj));

// Maps a block across an array.
//
// array - An array of elements.
// block - A block that takes an element and its index in `array` as its
//         arguments and returns a new element. The block must not be nil.
//
// Returns an array that contains all values of `array` after `block` has been
// applied. If `block` returns `nil`, the element is not present in the returned
// array. The order is being maintained.
OVERLOADABLE NSArray *ASTMap(NSArray *array, id(^block)(id obj, NSUInteger idx));

// Maps a block across a dictionary.
//
// dict  - A dictionary of elements.
// block - A block that takes a value as its only argument and returns a new
//         value. The block must not be nil.
//
// Returns a dictionary that contains all keys and values of `dict` after
// `block` has been applied to the value. If `block` returns `nil`, the key and
// value are not present in the returned dictionary.
OVERLOADABLE NSDictionary *ASTMap(NSDictionary *dict, id(^block)(id obj));

// Maps a block across a dictionary.
//
// dict  - A dictionary of elements.
// block - A block that takes a key and a value as its arguments and returns a
//         new value. The block must not be nil.
//
// Returns a dictionary that contains all keys and values of `dict` after
// `block` has been applied to them. If `block` returns `nil`, the key and value
// are not present in the returned dictionary.
OVERLOADABLE NSDictionary *ASTMap(NSDictionary *dict, id(^block)(id key, id obj));

// Maps a block across a set.
//
// set   - A set of elements.
// block - A block that takes an element as its only argument and returns a new
//         element. The block must not be nil.
//
// Returns a set that contains all values of `set` after `block` has been
// applied. If `block` returns `nil`, the element is not present in the returned
// set.
OVERLOADABLE NSSet *ASTMap(NSSet *set, id(^block)(id obj));

// Maps a block across an ordered set.
//
// set   - An ordered set of elements.
// block - A block that takes an element as its only argument and returns a new
//         element. The block must not be nil.
//
// Returns an ordered set that contains all values of `set` after `block` has
// been applied. If `block` returns `nil`, the element is not present in the
// returned set. The order is being maintained.
OVERLOADABLE NSOrderedSet *ASTMap(NSOrderedSet *set, id(^block)(id obj));

// Maps a block across an ordered set.
//
// set   - An ordered set of elements.
// block - A block that takes an element and its index in `set` as its
//         arguments and returns a new element. The block must not be nil.
//
// Returns an ordered set that contains all values of `set` after `block` has
// been applied. If `block` returns `nil`, the element is not present in the
// returned set. The order is being maintained.
OVERLOADABLE NSOrderedSet *ASTMap(NSOrderedSet *array, id(^block)(id obj, NSUInteger idx));
