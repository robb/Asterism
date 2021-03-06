//
//  ASTDifference.h
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTDifference) NSArray *__ASTDifference_NSArray(NSArray *array, NSArray *other);
ASTERISM_USE_INSTEAD(ASTDifference) NSSet *__ASTDifference_NSSet(NSSet *set, NSSet *other);
ASTERISM_USE_INSTEAD(ASTDifference) NSOrderedSet *__ASTDifference_NSOrderedSet(NSOrderedSet *set, NSOrderedSet *other);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Returns the difference between two arrays.
///
/// @param array An array of elements.
/// @param other An array of elements.
///
/// @returns an array containing the elements of @c array that are not present
///          in @c other. The order is being maintained.
ASTERISM_OVERLOADABLE NSArray *ASTDifference(NSArray *array, NSArray *other) {
    return __ASTDifference_NSArray(array, other);
}

/// Returns the difference between two sets.
///
/// @param set   A set of elements.
/// @param other A set of elements.
///
/// @returns A set containing the elements of @c set that are not present in
///          @c other.
ASTERISM_OVERLOADABLE NSSet *ASTDifference(NSSet *set, NSSet *other) {
    return __ASTDifference_NSSet(set, other);
}

/// Returns the difference between two ordered sets.
///
/// @param set   An ordered set of elements.
/// @param other An ordered set of elements.
///
/// @returns An ordered set containing the elements of @c set that are not
///          present in @c other.
ASTERISM_OVERLOADABLE NSOrderedSet *ASTDifference(NSOrderedSet *set, NSOrderedSet *other) {
    return __ASTDifference_NSOrderedSet(set, other);
}

#pragma clang diagnostic pop
