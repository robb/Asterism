//
//  ASTMap.h
//  Asterism
//
//  Created by Robert Böhnke on 5/22/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTMap) NSArray *__ASTMap_NSArray(NSArray *array, id(NS_NOESCAPE ^block)(id obj));
ASTERISM_USE_INSTEAD(ASTMap) NSArray *__ASTMap_NSArray_withIndex(NSArray *array, id(NS_NOESCAPE ^block)(id obj, NSUInteger idx));
ASTERISM_USE_INSTEAD(ASTMap) NSDictionary *__ASTMap_NSDictionary(NSDictionary *dict, id(NS_NOESCAPE ^block)(id obj));
ASTERISM_USE_INSTEAD(ASTMap) NSDictionary *__ASTMap_NSDictionary_keysAndValues(NSDictionary *dict, id(NS_NOESCAPE ^block)(id key, id obj));
ASTERISM_USE_INSTEAD(ASTMap) NSArray *__ASTMap_NSDictionary_keysAndValues_toArray(NSDictionary *dict, id(NS_NOESCAPE ^block)(id key, id obj));
ASTERISM_USE_INSTEAD(ASTMap) NSSet *__ASTMap_NSSet(NSSet *set, id(NS_NOESCAPE ^block)(id obj));
ASTERISM_USE_INSTEAD(ASTMap) NSOrderedSet *__ASTMap_NSOrderedSet(NSOrderedSet *set, id(NS_NOESCAPE ^block)(id obj));
ASTERISM_USE_INSTEAD(ASTMap) NSOrderedSet *__ASTMap_NSOrderedSet_withIndex(NSOrderedSet *array, id(NS_NOESCAPE ^block)(id obj, NSUInteger idx));
ASTERISM_USE_INSTEAD(ASTMap) NSArray *__ASTMap_NSFastEnumeration(id<NSFastEnumeration> collection, id(NS_NOESCAPE ^block)(id obj));
ASTERISM_USE_INSTEAD(ASTMap) NSArray *__ASTMap_NSFastEnumeration_withIndex(id<NSFastEnumeration> collection, id(NS_NOESCAPE ^block)(id obj, NSUInteger idx));

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Maps a block across an array.
///
/// @param array An array of elements.
/// @param block A block that takes an element as its only argument and returns
///              a new element. The block must not be @c nil .
///
/// @returns An array that contains all values of @c array after @c block has
///          been applied. If @c block returns @c nil . the element is not
///          present in the returned array. The order is being maintained.
ASTERISM_OVERLOADABLE NSArray *ASTMap(NSArray *array, id(NS_NOESCAPE ^block)(id obj)) {
    return __ASTMap_NSArray(array, block);
}

/// Maps a block across an array.
///
/// @param array An array of elements.
/// @param block A block that takes an element and its index in @c array as its
///              arguments and returns a new element. The block must not be
///              @c nil .
///
/// @returns An array that contains all values of @c array after @c block has
///          been applied. If @c block returns @c nil , the element is not
///          present in the returned array. The order is being maintained.
ASTERISM_OVERLOADABLE NSArray *ASTMap(NSArray *array, id(NS_NOESCAPE ^block)(id obj, NSUInteger idx)) {
    return __ASTMap_NSArray_withIndex(array, block);
}

/// Maps a block across a dictionary.
///
/// @param dict  A dictionary of elements.
/// @param block A block that takes a value as its only argument and returns a
///              new value. The block must not be @c nil .
///
/// @returns A dictionary that contains all keys and values of @c dict after
///          @c block has been applied to the value. If @c block returns
///          @c nil , the key and value are not present in the returned
///          dictionary.
ASTERISM_OVERLOADABLE NSDictionary *ASTMap(NSDictionary *dict, id(NS_NOESCAPE ^block)(id obj)) {
    return __ASTMap_NSDictionary(dict, block);
}

/// Maps a block across a dictionary.
///
/// @param dict  A dictionary of elements.
/// @param block A block that takes a key and a value as its arguments and
///              returns a new value. The block must not be @c nil .
///
/// @returns A dictionary that contains all keys and values of @c dict after
///          @c block has been applied to them. If @c block returns @c nil m the
///          key and value are not present in the returned dictionary.
ASTERISM_OVERLOADABLE NSDictionary *ASTMap(NSDictionary *dict, id(NS_NOESCAPE ^block)(id key, id obj)) {
    return __ASTMap_NSDictionary_keysAndValues(dict, block);
}

/// Maps a block across a dictionary to an array.
///
/// @param dict  A dictionary of elements.
/// @param block A block that takes a key and a value as its arguments and
///              returns a new value. The block must not be @c nil .
///
/// @returns An array that contains all key value pairs of @c dict after @c block has
///          been applied. If @c block returns @c nil , the element is not
///          present in the returned array. The order is not defined.
ASTERISM_OVERLOADABLE NSArray *ASTMapPairs(NSDictionary *dict, id(NS_NOESCAPE ^block)(id key, id obj)) {
    return __ASTMap_NSDictionary_keysAndValues_toArray(dict, block);
}


/// Maps a block across a set.
///
/// @param set   A set of elements.
/// @param block A block that takes an element as its only argument and returns
///              a new element. The block must not be @c nil .
///
/// @returns A set that contains all values of @c set after @c block has been
///          applied. If @c block returns @c nil , the element is not present in
///          the returned set.
ASTERISM_OVERLOADABLE NSSet *ASTMap(NSSet *set, id(NS_NOESCAPE ^block)(id obj)) {
    return __ASTMap_NSSet(set, block);
}

/// Maps a block across an ordered set.
///
/// @param set   An ordered set of elements.
/// @param block A block that takes an element as its only argument and returns
///              a new element. The block must not be @c nil .
///
/// @returns An ordered set that contains all values of @c set after @c block
///          has been applied. If @c block returns @c nil , the element is not
///          present in the returned set. The order is being maintained.
ASTERISM_OVERLOADABLE NSOrderedSet *ASTMap(NSOrderedSet *set, id(NS_NOESCAPE ^block)(id obj)) {
    return __ASTMap_NSOrderedSet(set, block);
}

/// Maps a block across an ordered set.
///
/// @param set   An ordered set of elements.
/// @param block A block that takes an element and its index in @c set as its
///              arguments and returns a new element. The block must not be @c nil .
///
/// @returns An ordered set that contains all values of @c set after @c block has
///          been applied. If @c block returns @c nil , the element is not
///          present in the returned set. The order is being maintained.
ASTERISM_OVERLOADABLE NSOrderedSet *ASTMap(NSOrderedSet *set, id(NS_NOESCAPE ^block)(id obj, NSUInteger idx)) {
    return __ASTMap_NSOrderedSet_withIndex(set, block);
}

/// Maps a block across a collection
///
/// @param collection A collection of elements.
/// @param block      A block that takes an element as its only argument and
///                   returns a new element. The block must not be @c nil .
///
/// @returns An array that contains all values of @c collection after @c block
///          has been applied. If @c block returns @c nil . the element is not
///          present in the returned array. The order is being maintained.
ASTERISM_OVERLOADABLE NSArray *ASTMap(id<NSFastEnumeration> collection, id(NS_NOESCAPE ^block)(id obj)) {
    return __ASTMap_NSFastEnumeration(collection, block);
}

/// Maps a block across a collection
///
/// @param collection A collection of elements.
/// @param block      A block that takes an element and its index in @c set as
///                   its arguments and returns a new element.
///                   The block must not be @c nil .
///
/// @returns An array that contains all values of @c collection after @c block
///          has been applied. If @c block returns @c nil . the element is not
///          present in the returned array. The order is being maintained.
ASTERISM_OVERLOADABLE NSArray *ASTMap(id<NSFastEnumeration> collection, id(NS_NOESCAPE ^block)(id obj, NSUInteger idx)) {
    return __ASTMap_NSFastEnumeration_withIndex(collection, block);
}

#pragma clang diagnostic pop
