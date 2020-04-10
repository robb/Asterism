//
//  ASTMinMax.h
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTMin) id __ASTMin_NSDictionary(NSDictionary *dict);
ASTERISM_USE_INSTEAD(ASTMin) id __ASTMin_NSDictionary_comparator(NSDictionary *dict, NSComparator comparator);
ASTERISM_USE_INSTEAD(ASTMax) id __ASTMax_NSDictionary(NSDictionary *dict);
ASTERISM_USE_INSTEAD(ASTMax) id __ASTMax_NSDictionary_comparator(NSDictionary *dict, NSComparator comparator);
ASTERISM_USE_INSTEAD(ASTMin) id __ASTMin_NSFastEnumeration(id<NSFastEnumeration> collection);
ASTERISM_USE_INSTEAD(ASTMin) id __ASTMin_NSFastEnumeration_comparator(id<NSFastEnumeration> collection, NSComparator comparator);
ASTERISM_USE_INSTEAD(ASTMax) id __ASTMax_NSFastEnumeration(id<NSFastEnumeration> collection);
ASTERISM_USE_INSTEAD(ASTMax) id __ASTMax_NSFastEnumeration_comparator(id<NSFastEnumeration> collection, NSComparator comparator);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Returns the minimum of the values of a dictionary by invoking @c -compare: .
///
/// @param dict A dictionary of elements.
///
/// @returns The minimum of the values of @c dict comparing all values by
///          invoking  @c -compare: .
ASTERISM_OVERLOADABLE id ASTMin(NSDictionary *dict) {
    return __ASTMin_NSDictionary(dict);
}

/// Returns the minimum of the values of a dictionary by using an
/// @c NSComparator .
///
/// @param dict       A dictionary of elements.
/// @param comparator An @c NSComparator used to compare the values.
///                   This argument must not be @c nil .
///
/// @returns The minimum of the values of @c dict comparing all values using
///          @c comparator .
ASTERISM_OVERLOADABLE id ASTMin(NSDictionary *dict, NSComparator comparator) {
    return __ASTMin_NSDictionary_comparator(dict, comparator);
}

/// Returns the maximum of the values of a dictionary by invoking @c -compare: .
///
/// @param dict A dictionary of elements.
///
/// @returns The maximum of the values of @c dict comparing all values by
///          invoking @c -compare: .
ASTERISM_OVERLOADABLE id ASTMax(NSDictionary *dict) {
    return __ASTMax_NSDictionary(dict);
}

/// Returns the maximum of the values of a dictionary by using an
/// @c NSComparator .
///
/// @c dict       A dictionary of elements.
/// @c comparator An @c NSComparator used to compare the values.
///               This argument must not be @c nil .
///
/// @returns The maximum of the values of @c dict comparing all values using
///          @c comparator.
ASTERISM_OVERLOADABLE id ASTMax(NSDictionary *dict, NSComparator comparator) {
    return __ASTMax_NSDictionary_comparator(dict, comparator);
}

/// Returns the minimum of a collection by invoking @c -compare: .
///
/// @c collection An object that implements NSFastEnumeration.
///
/// @returns The minimum of the collection by comparing all values by invoking
///          @c -compare: .
ASTERISM_OVERLOADABLE id ASTMin(id<NSFastEnumeration> collection) {
    return __ASTMin_NSFastEnumeration(collection);
}

/// Returns the minimum of a collection by using an @c NSComparator .
///
/// @param collection An object that implements @c NSFastEnumeration .
/// @param comparator An @c NSComparator used to compare the values.
///                   This argument must not be @c nil .
///
/// @returns The minimum of the collection by comparing all values using
///          @c comparator .
ASTERISM_OVERLOADABLE id ASTMin(id<NSFastEnumeration> collection, NSComparator comparator) {
    return __ASTMin_NSFastEnumeration_comparator(collection, comparator);
}

/// Returns the maximum of a collection by invoking @c -compare: .
///
/// @param collection An object that implements @c NSFastEnumeration .
///
/// @returns The maximum of the collection by comparing all values by invoking
///          @c -compare: .
ASTERISM_OVERLOADABLE id ASTMax(id<NSFastEnumeration> collection) {
    return __ASTMax_NSFastEnumeration(collection);
}

/// Returns the maximum of a collection by using an @c NSComparator .
///
/// @param collection An object that implements @c NSFastEnumeration .
/// @param comparator An @c NSComparator used to compare the values.
///                   This argument must not be @c nil .
///
/// @returns The maximum of the collection by comparing all values using
///          @c comparator.
ASTERISM_OVERLOADABLE id ASTMax(id<NSFastEnumeration> collection, NSComparator comparator) {
    return __ASTMax_NSFastEnumeration_comparator(collection, comparator);
}

#pragma clang diagnostic pop
