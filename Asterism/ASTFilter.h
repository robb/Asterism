//
//  ASTFilter.h
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTFilter) NSArray *__ASTFilter_NSArray(NSArray *array, BOOL(NS_NOESCAPE ^block)(id obj));
ASTERISM_USE_INSTEAD(ASTFilter) NSArray *__ASTFilter_NSArray_withIndex(NSArray *array, BOOL(NS_NOESCAPE ^block)(id obj, NSUInteger idx));
ASTERISM_USE_INSTEAD(ASTFilter) NSDictionary *__ASTFilter_NSDictionary(NSDictionary *dict, BOOL(NS_NOESCAPE ^block)(id obj));
ASTERISM_USE_INSTEAD(ASTFilter) NSDictionary *__ASTFilter_NSDictionary_keysAndValues(NSDictionary *dict, BOOL(NS_NOESCAPE ^block)(id key, id obj));
ASTERISM_USE_INSTEAD(ASTFilter) NSSet *__ASTFilter_NSSet(NSSet *set, BOOL(NS_NOESCAPE ^block)(id obj));
ASTERISM_USE_INSTEAD(ASTFilter) NSOrderedSet *__ASTFilter_NSOrderedSet(NSOrderedSet *set, BOOL(NS_NOESCAPE ^block)(id obj));
ASTERISM_USE_INSTEAD(ASTFilter) NSOrderedSet *__ASTFilter_NSOrderedSet_withIndex(NSOrderedSet *array, BOOL(NS_NOESCAPE ^block)(id obj, NSUInteger idx));

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Filters out the elements of an array that fail a test.
///
/// @param array An array of elements.
/// @param block A block that takes an element as its only argument and returns
///              @c YES if the element passes the test.
///              The block must not be @c nil .
///
/// @returns An array of all values in @c array that pass the test. The order is
///          being maintained.
ASTERISM_OVERLOADABLE NSArray *ASTFilter(NSArray *array, BOOL(NS_NOESCAPE ^block)(id obj)) {
    return __ASTFilter_NSArray(array, block);
}

/// Filters out the elements of an array that fail a test.
///
/// @param array An array of elements.
/// @param block A block that takes an element as well as its index in @c array
///              as its arguments and returns @c YES if the element passes the
///              test. The block must not be @c nil .
///
/// @returns an array of all values in @c array that pass the test. The order is
///          being maintained.
ASTERISM_OVERLOADABLE NSArray *ASTFilter(NSArray *array, BOOL(NS_NOESCAPE ^block)(id obj, NSUInteger idx)) {
    return __ASTFilter_NSArray_withIndex(array, block);
}

/// Filters out the values of a dictionary that fail a test.
///
/// @param dict  A dictionary of elements.
/// @param block A block that takes a value of @c dict as its only argument and
///              returns @c YES if the element passes the test.
///              The block must not be @c nil .
///
/// @returns A dictionary of the keys and values in @c dict for which the values
///          passed the test.
ASTERISM_OVERLOADABLE NSDictionary *ASTFilter(NSDictionary *dict, BOOL(NS_NOESCAPE ^block)(id obj)) {
    return __ASTFilter_NSDictionary(dict, block);
}

/// Filters out the keys and values of a dictionary that fail a test.
///
/// @param dict  A dictionary of elements.
/// @param block A block that takes a key and a value of @c dict as its
///              arguments and returns @c YES if the element passes the test.
///              The block must not be @c nil .
///
/// @returns A dictionary of the keys and values in @c dict that passed the
///          test.
ASTERISM_OVERLOADABLE NSDictionary *ASTFilter(NSDictionary *dict, BOOL(NS_NOESCAPE ^block)(id key, id obj)) {
    return __ASTFilter_NSDictionary_keysAndValues(dict, block);
}

/// Filters out the elements of a set that fail a test.
///
/// @param set   A set of elements.
/// @param block A block that takes an element as its only argument and returns
///              @c YES if the element passes the test.
///              The block must not be @c nil .
///
/// @returns A set of all values in @c set that pass the test.
ASTERISM_OVERLOADABLE NSSet *ASTFilter(NSSet *set, BOOL(NS_NOESCAPE ^block)(id obj)) {
    return __ASTFilter_NSSet(set, block);
}

/// Filters out the elements of an ordered set that fail a test.
///
/// @param set   An ordered set of elements.
/// @param block A block that takes an element as its only argument and returns
///              @c YES if the element passes the test.
///              The block must not be @c nil .
///
/// @returns An ordered set of all values in @c set that pass the test.
ASTERISM_OVERLOADABLE NSOrderedSet *ASTFilter(NSOrderedSet *set, BOOL(NS_NOESCAPE ^block)(id obj)) {
    return __ASTFilter_NSOrderedSet(set, block);
}

/// Filters out the elements of an ordered set that fail a test.
///
/// @param set   An ordered set of elements.
/// @param block A block that takes an element as well as its index in @c set as
///              its arguments and returns @c YES if the element passes the
///              test.
///              The block must not be @c nil .
///
/// @returns An ordered set of all values in @c set that pass the test. The
///          order is being maintained.
ASTERISM_OVERLOADABLE NSOrderedSet *ASTFilter(NSOrderedSet *set, BOOL(NS_NOESCAPE ^block)(id obj, NSUInteger idx)) {
    return __ASTFilter_NSOrderedSet_withIndex(set, block);
}

#pragma clang diagnostic pop
