//
//  ASTReject.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Filters out the elements of an array that pass a test.
//
// array - An array of elements. This argument must not be nil.
// block - A block that takes an element as its only argument and returns `YES`
//         if the element passes the test. The block must no be nil.
//
// Returns an array of all values in `array` that fail the test. The order is
// being maintained.
OVERLOADABLE NSArray *ASTReject(NSArray *array, BOOL(^block)(id obj));

// Filters out the elements of an array that pass a test.
//
// array - An array of elements. This argument must not be nil.
// block - A block that takes an element as well as its index in `array` as its
//         arguments and returns `YES` if the element passes the test. The block
//         must no be nil.
//
// Returns an array of all values in `array` that fail the test. The order is
// being maintained.
OVERLOADABLE NSArray *ASTReject(NSArray *array, BOOL(^block)(id obj, NSUInteger idx));

// Filters out the values of a dictionary that pass a test.
//
// dict  - A dictionary of elements. This argument must not be nil.
// block - A block that takes a value of `dict` as its only argument and returns
//         `YES` if the element passes the test. The block must no be nil.
//
// Returns a dictionary of the keys and values in `dict` for which the values
// failed the test.
OVERLOADABLE NSDictionary *ASTReject(NSDictionary *dict, BOOL(^block)(id obj));

// Filters out the keys and values of a dictionary that pass a test.
//
// dict  - A dictionary of elements. This argument must not be nil.
// block - A block that takes a key and a value of `dict` as its arguments and
//         returns `YES` if the element passes the test. The block must no be
//         nil.
//
// Returns a dictionary of the keys and values in `dict` that fail the test.
OVERLOADABLE NSDictionary *ASTReject(NSDictionary *dict, BOOL(^block)(id key, id obj));

// Filters out the elements of a set that pass a test.
//
// set   - An array of elements. This argument must not be nil.
// block - A block that takes an element as its only argument and returns `YES`
//         if the element passes the test. The block must no be nil.
//
// Returns a set of all values in `set` that fail the test.
OVERLOADABLE NSSet *ASTReject(NSSet *set, BOOL(^block)(id obj));
