//
//  ASTReject.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTReject) NSArray *__ASTReject_NSArray(NSArray *array, BOOL(^block)(id obj));
ASTERISM_USE_INSTEAD(ASTReject) NSArray *__ASTReject_NSArray_withIndex(NSArray *array, BOOL(^block)(id obj, NSUInteger idx));
ASTERISM_USE_INSTEAD(ASTReject) NSDictionary *__ASTReject_NSDictionary(NSDictionary *dict, BOOL(^block)(id obj));
ASTERISM_USE_INSTEAD(ASTReject) NSDictionary *__ASTReject_NSDictionary_keysAndValues(NSDictionary *dict, BOOL(^block)(id key, id obj));
ASTERISM_USE_INSTEAD(ASTReject) NSSet *__ASTReject_NSSet(NSSet *set, BOOL(^block)(id obj));
ASTERISM_USE_INSTEAD(ASTReject) NSOrderedSet *__ASTReject_NSOrderedSet(NSOrderedSet *set, BOOL(^block)(id obj));
ASTERISM_USE_INSTEAD(ASTReject) NSOrderedSet *__ASTReject_NSOrderedSet_withIndex(NSOrderedSet *set, BOOL(^block)(id obj, NSUInteger idx));

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Filters out the elements of an array that pass a test.
///
/// @param array An array of elements.
/// @param block A block that takes an element as its only argument and returns
///              @c YES if the element passes the test. The block must not be
///              @c nil .
///
/// @returns An array of all values in @c array that fail the test. The order is
///          being maintained.
ASTERISM_OVERLOADABLE NSArray *ASTReject(NSArray *array, BOOL(^block)(id obj)) {
    return __ASTReject_NSArray(array, block);
}

/// Filters out the elements of an array that pass a test.
///
/// @param array An array of elements.
/// @param block A block that takes an element as well as its index in @c array
///              as its arguments and returns @c YES if the element passes the
///              test. The block must not be @c nil .
///
/// @returns An array of all values in @c array that fail the test. The order is
///          being maintained.
ASTERISM_OVERLOADABLE NSArray *ASTReject(NSArray *array, BOOL(^block)(id obj, NSUInteger idx)) {
    return __ASTReject_NSArray_withIndex(array, block);
}

/// Filters out the values of a dictionary that pass a test.
///
/// @param dict  A dictionary of elements.
/// @param block A block that takes a value of @c dict as its only argument and
///              returns @c YES if the element passes the test.
///              The block must not be @c nil .
///
/// @returns A dictionary of the keys and values in @c dict for which the values
///          failed the test.
ASTERISM_OVERLOADABLE NSDictionary *ASTReject(NSDictionary *dict, BOOL(^block)(id obj)) {
    return __ASTReject_NSDictionary(dict, block);
}

/// Filters out the keys and values of a dictionary that pass a test.
///
/// @param dict  A dictionary of elements.
/// @param block A block that takes a key and a value of @c dict as its
///              arguments and returns @c YES if the element passes the test.
///              The block must not be @c nil .
///
/// @returns A dictionary of the keys and values in @c dict that fail the test.
ASTERISM_OVERLOADABLE NSDictionary *ASTReject(NSDictionary *dict, BOOL(^block)(id key, id obj)) {
    return __ASTReject_NSDictionary_keysAndValues(dict, block);
}

/// Filters out the elements of a set that pass a test.
///
/// @param set   A set of elements.
/// @param block A block that takes an element as its only argument and returns
///              @c YES if the element passes the test.
///              The block must not be @c nil .
///
/// @returns A set of all values in @c set that fail the test.
ASTERISM_OVERLOADABLE NSSet *ASTReject(NSSet *set, BOOL(^block)(id obj)) {
    return __ASTReject_NSSet(set, block);
}

/// Filters out the elements of an ordered set that pass a test.
///
/// @param set   An ordered set of elements.
/// @param block A block that takes an element as its only argument and returns
///              @c YES if the element passes the test.
///              The block must not be @c nil .
///
/// @returns An ordered set of all values in @c set that fail the test.
ASTERISM_OVERLOADABLE NSOrderedSet *ASTReject(NSOrderedSet *set, BOOL(^block)(id obj)) {
    return __ASTReject_NSOrderedSet(set, block);
}

/// Filters out the elements of an ordered set that pass a test.
///
/// @param set   An ordered set of elements.
/// @param block A block that takes an element as well as its index in @c set
///              as its arguments and returns @c YES if the element passes the
///              test. The block must not be @c nil .
///
/// @returns An ordered set of all values in @c set that fail the test.
///          The order  is being maintained.
ASTERISM_OVERLOADABLE NSOrderedSet *ASTReject(NSOrderedSet *set, BOOL(^block)(id obj, NSUInteger idx)) {
    return __ASTReject_NSOrderedSet_withIndex(set, block);
}

#pragma clang diagnostic pop
