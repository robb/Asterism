//
//  ASTFind.h
//  Asterism
//
//  Created by Robert Böhnke on 6/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTFind) id __ASTFind_NSArray(NSArray *array, NS_NOESCAPE BOOL(^block)(id obj));
ASTERISM_USE_INSTEAD(ASTFind) id __ASTFind_NSArray_withIndex(NSArray *array, NS_NOESCAPE BOOL(^block)(id obj, NSUInteger idx));
ASTERISM_USE_INSTEAD(ASTFind) id __ASTFind_NSDictionary(NSDictionary *dict, NS_NOESCAPE BOOL(^block)(id obj));
ASTERISM_USE_INSTEAD(ASTFind) id __ASTFind_NSDictionary_keysAndValues(NSDictionary *dict, NS_NOESCAPE BOOL(^block)(id key, id obj));
ASTERISM_USE_INSTEAD(ASTFind) id __ASTFind_NSFastEnumeration(id<NSFastEnumeration> collection, NS_NOESCAPE BOOL(^block)(id obj));

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Finds an element in an array.
///
/// @param array An array of elements.
/// @param block A block that takes an element as its only argument and returns
///              @c YES if it matches the search criteria.
///              The block must not be @c nil .
///
/// @returns The first item in @c array for which @c block returns @c YES or
///          @c nil if no such value was found.
ASTERISM_OVERLOADABLE id ASTFind(NSArray *array, NS_NOESCAPE BOOL(^block)(id obj)) {
    return __ASTFind_NSArray(array, block);
}

/// Finds an element in an array.
///
/// @param array An array of elements.
/// @param block A block that takes an element and its index in @c array as its
///              arguments and returns @c YES if this is they match the search
///              criteria. The block must not be @c nil .
///
/// @returns The first item in @c array for which @c block returns @c YES or
///          @c nil if no such value was found.
ASTERISM_OVERLOADABLE id ASTFind(NSArray *array, NS_NOESCAPE BOOL(^block)(id obj, NSUInteger idx)) {
    return __ASTFind_NSArray_withIndex(array, block);
}

/// Finds a value in a dictionary.
///
/// @param dict  A dictionary of elements.
/// @param block A block that takes a value as its argument and returns @c YES
///              if it matches the search criteria.
///              The block must not be @c nil .
///
/// @returns Any value in @c dict for which @c block returns @c YES or @c nil if no
///          such value was found.
ASTERISM_OVERLOADABLE id ASTFind(NSDictionary *dict, NS_NOESCAPE BOOL(^block)(id obj)) {
    return __ASTFind_NSDictionary(dict, block);
}

/// Finds a value in a dictionary.
///
/// @param dict  A dictionary of elements.
/// @param block A block that takes a key and its value as its arguments and
///              returns @c YES if they match the search criteria.
///              The block must not be @c nil .
///
/// @returns Any value in @c dict for which @c block returns @c YES or @c nil
///          if no such value was found.
ASTERISM_OVERLOADABLE id ASTFind(NSDictionary *dict, NS_NOESCAPE BOOL(^block)(id key, id obj)) {
    return __ASTFind_NSDictionary_keysAndValues(dict, block);
}

/// Finds a value in a collection.
///
/// @param collection An object that implements @c NSFastEnumeration.
/// @param block      A block that takes an element as its only argument and
///                   returns @c YES if it matches the search criteria.
///                   The block must not be @c nil .
///
/// @returns A value in @c collection for which @c block returns @c YES or
///          @c nil if no such value was found. If @c collection makes an order
///          guarantee, @c ASTFind will return the first value matching the
///          search criteria.
ASTERISM_OVERLOADABLE id ASTFind(id<NSFastEnumeration> collection, NS_NOESCAPE BOOL(^block)(id obj)) {
    return __ASTFind_NSFastEnumeration(collection, block);
}

#pragma clang diagnostic pop
