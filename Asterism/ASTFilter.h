//
//  ASTFilter.h
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Filters out the elements of an array that fail a test.
//
// array - An array of elements.
// block - A block that takes an element as its only argument and returns `YES`
//         if the element passes the test. The block must no be nil.
//
// Returns an array of all values in `array` that pass the test. The order is
// being maintained.
OVERLOADABLE NSArray *ASTFilter(NSArray *array, BOOL(^block)(id obj));

// Filters out the elements of an array that fail a test.
//
// array - An array of elements.
// block - A block that takes an element as well as its index in `array` as its
//         arguments and returns `YES` if the element passes the test. The block
//         must no be nil.
//
// Returns an array of all values in `array` that pass the test. The order is
// being maintained.
OVERLOADABLE NSArray *ASTFilter(NSArray *array, BOOL(^block)(id obj, NSUInteger idx));

// Filters out the values of a dictionary that fail a test.
//
// dict  - A dictionary of elements.
// block - A block that takes a value of `dict` as its only argument and returns
//         `YES` if the element passes the test. The block must no be nil.
//
// Returns a dictionary of the keys and values in `dict` for which the values
// passed the test.
OVERLOADABLE NSDictionary *ASTFilter(NSDictionary *dict, BOOL(^block)(id obj));

// Filters out the keys and values of a dictionary that fail a test.
//
// dict  - A dictionary of elements.
// block - A block that takes a key and a value of `dict` as its arguments and
//         returns `YES` if the element passes the test. The block must no be
//         nil.
//
// Returns a dictionary of the keys and values in `dict` that passed the test.
OVERLOADABLE NSDictionary *ASTFilter(NSDictionary *dict, BOOL(^block)(id key, id obj));

// Filters out the elements of a set that fail a test.
//
// set   - An array of elements.
// block - A block that takes an element as its only argument and returns `YES`
//         if the element passes the test. The block must no be nil.
//
// Returns a set of all values in `set` that pass the test.
OVERLOADABLE NSSet *ASTFilter(NSSet *set, BOOL(^block)(id obj));

// Filters out the elements of an ordered set that fail a test.
//
// set   - An ordered set of elements.
// block - A block that takes an element as its only argument and returns `YES`
//         if the element passes the test. The block must no be nil.
//
// Returns an ordered set of all values in `set` that pass the test.
OVERLOADABLE NSOrderedSet *ASTFilter(NSOrderedSet *set, BOOL(^block)(id obj));

// Filters out the elements of an ordered set that fail a test.
//
// set   - An ordered set of elements.
// block - A block that takes an element as well as its index in `set` as its
//         arguments and returns `YES` if the element passes the test. The block
//         must no be nil.
//
// Returns an ordered set of all values in `set` that pass the test. The order
// is being maintained.
OVERLOADABLE NSOrderedSet *ASTFilter(NSOrderedSet *array, BOOL(^block)(id obj, NSUInteger idx));
