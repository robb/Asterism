//
//  ASTShuffle.h
//  Asterism
//
//  Created by Robert Böhnke on 11/02/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTShuffle) NSArray *__ASTShuffle_NSArray(NSArray *array);
ASTERISM_USE_INSTEAD(ASTShuffle) NSOrderedSet *__ASTShuffle_NSOrderedSet(NSOrderedSet *set);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Shuffles an array.
///
/// @param array An array of elements.
///
/// @returns A copy of @c array shuffled using the Fisher-Yates shuffle.
ASTERISM_OVERLOADABLE NSArray *ASTShuffle(NSArray *array) {
    return __ASTShuffle_NSArray(array);
}

/// Shuffles an ordered set.
///
/// @param set - An ordered set of elements.
///
/// @returns A copy of @c set shuffled using the Fisher-Yates shuffle.
ASTERISM_OVERLOADABLE NSOrderedSet *ASTShuffle(NSOrderedSet *set) {
    return __ASTShuffle_NSOrderedSet(set);
}

#pragma clang diagnostic pop
