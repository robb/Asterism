//
//  ASTFilter.h
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

// You should not call these methods directly.
NSArray *__ASTFilter_NSArray_withoutIndex(NSArray *array, BOOL(^block)(id obj));
NSArray *__ASTFilter_NSArray_withIndex(NSArray *array, BOOL(^block)(id obj, NSUInteger idx));
NSDictionary *__ASTFilter_NSDictionary_values(NSDictionary *dict, BOOL(^block)(id obj));
NSDictionary *__ASTFilter_NSDictionary_valuesAndKeys(NSDictionary *dict, BOOL(^block)(id key, id obj));
NSSet *__ASTFilter_NSSet(NSSet *set, BOOL(^block)(id obj));
NSOrderedSet *__ASTFilter_NSOrderedSet_withoutIndex(NSOrderedSet *set, BOOL(^block)(id obj));
NSOrderedSet *__ASTFilter_NSOrderedSet_withIndex(NSOrderedSet *array, BOOL(^block)(id obj, NSUInteger idx));

// Filters out the elements of an array that fail a test.
//
// array - An array of elements.
// block - A block that takes an element as its only argument and returns `YES`
//         if the element passes the test. The block must no be nil.
//
// Returns an array of all values in `array` that pass the test. The order is
// being maintained.
static inline __attribute__((overloadable)) NSArray *ASTFilter(NSArray *array, BOOL(^block)(id obj)) {
    return __ASTFilter_NSArray_withoutIndex(array, block);
}

// Filters out the elements of an array that fail a test.
//
// array - An array of elements.
// block - A block that takes an element as well as its index in `array` as its
//         arguments and returns `YES` if the element passes the test. The block
//         must no be nil.
//
// Returns an array of all values in `array` that pass the test. The order is
// being maintained.
static inline __attribute__((overloadable)) NSArray *ASTFilter(NSArray *array, BOOL(^block)(id obj, NSUInteger idx)) {
    return __ASTFilter_NSArray_withIndex(array, block);
}

// Filters out the values of a dictionary that fail a test.
//
// dict  - A dictionary of elements.
// block - A block that takes a value of `dict` as its only argument and returns
//         `YES` if the element passes the test. The block must no be nil.
//
// Returns a dictionary of the keys and values in `dict` for which the values
// passed the test.
static inline __attribute__((overloadable)) NSDictionary *ASTFilter(NSDictionary *dict, BOOL(^block)(id obj)) {
    return __ASTFilter_NSDictionary_values(dict, block);
}

// Filters out the keys and values of a dictionary that fail a test.
//
// dict  - A dictionary of elements.
// block - A block that takes a key and a value of `dict` as its arguments and
//         returns `YES` if the element passes the test. The block must no be
//         nil.
//
// Returns a dictionary of the keys and values in `dict` that passed the test.
static inline __attribute__((overloadable)) NSDictionary *ASTFilter(NSDictionary *dict, BOOL(^block)(id key, id obj)) {
    return __ASTFilter_NSDictionary_valuesAndKeys(dict, block);
}

// Filters out the elements of a set that fail a test.
//
// set   - A set of elements.
// block - A block that takes an element as its only argument and returns `YES`
//         if the element passes the test. The block must no be nil.
//
// Returns a set of all values in `set` that pass the test.
static inline __attribute__((overloadable)) NSSet *ASTFilter(NSSet *set, BOOL(^block)(id obj)) {
    return __ASTFilter_NSSet(set, block);
}

// Filters out the elements of an ordered set that fail a test.
//
// set   - An ordered set of elements.
// block - A block that takes an element as its only argument and returns `YES`
//         if the element passes the test. The block must no be nil.
//
// Returns an ordered set of all values in `set` that pass the test.
static inline __attribute__((overloadable)) NSOrderedSet *ASTFilter(NSOrderedSet *set, BOOL(^block)(id obj)) {
    return __ASTFilter_NSOrderedSet_withoutIndex(set, block);
}

// Filters out the elements of an ordered set that fail a test.
//
// set   - An ordered set of elements.
// block - A block that takes an element as well as its index in `set` as its
//         arguments and returns `YES` if the element passes the test. The block
//         must no be nil.
//
// Returns an ordered set of all values in `set` that pass the test. The order
// is being maintained.
static inline __attribute__((overloadable)) NSOrderedSet *ASTFilter(NSOrderedSet *array, BOOL(^block)(id obj, NSUInteger idx)) {
    return __ASTFilter_NSOrderedSet_withIndex(array, block);
}
