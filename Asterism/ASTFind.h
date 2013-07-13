//
//  ASTFind.h
//  Asterism
//
//  Created by Robert Böhnke on 6/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Finds an element in an array.
//
// array - An array of elements. This argument must not be nil.
// block - A block that takes an element as its only argument and returns `YES`
//         if it matches the search criteria. The block must not be nil.
//
// Returns the first item in `array` for which `block` returns `YES` or `nil` if
// no such value was found.
OVERLOADABLE id ASTFind(NSArray *array, BOOL(^block)(id obj));

// Finds an element in an array.
//
// array - An array of elements. This argument must not be nil.
// block - A block that takes an element and its index in `array` as its
//         arguments and returns `YES` if this is they match the search
//         criteria. The block must not be nil.
//
// Returns the first item in `array` for which `block` returns `YES` or `nil` if
// no such value was found.
OVERLOADABLE id ASTFind(NSArray *array, BOOL(^block)(id obj, NSUInteger idx));

// Finds a value in a dictionary.
//
// dict  - A dictionary of elements. This argument must not be nil.
// block - A block that takes a value as its argument and returns `YES` if it
//         matches the search criteria. The block must not be nil.
//
// Returns any value in `dict` for which `block` returns `YES` or `nil` if no
// such value was found.
OVERLOADABLE id ASTFind(NSDictionary *dict, BOOL(^block)(id obj));

// Finds a value in a dictionary.
//
// dict  - A dictionary of elements. This argument must not be nil.
// block - A block that takes a key and its value as its arguments and returns
//         `YES` if they match the search criteria. The block must not be nil.
//
// Returns any value in `dict` for which `block` returns `YES` or `nil` if no
// such value was found.
OVERLOADABLE id ASTFind(NSDictionary *dict, BOOL(^block)(id key, id obj));

// Finds a value in a collection.
//
// collection - An object that implements NSFastEnumeration.
// block      - A block that takes an element as its only argument and returns
//              `YES` if it matches the search criteria. The block must not be
//              nil.
//
// Returns a value in `collection` for which `block` returns `YES` or `nil` if
// no such value was found. If `collection` makes an order guarantee, `ASTFind`
// will return the first value matching the search criteria.
OVERLOADABLE id ASTFind(id<NSFastEnumeration> collection, BOOL(^block)(id obj));
