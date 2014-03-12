//
//  ASTShuffle.h
//  Asterism
//
//  Created by Robert Böhnke on 11/02/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

// You should not call these methods directly.
NSArray *__ASTShuffle_NSArray(NSArray *array);
NSOrderedSet *__ASTShuffle_NSOrderedSet(NSOrderedSet *set);

// Shuffles an array.
//
// array - An array of elements.
//
// Returns a copy of `array` shuffled using the Fisher-Yates shuffle.
static inline __attribute__((overloadable)) NSArray *ASTShuffle(NSArray *array) {
    return __ASTShuffle_NSArray(array);
}

// Shuffles an ordered set.
//
// set - An ordered set of elements.
//
// Returns a copy of `set` shuffled using the Fisher-Yates shuffle.
static inline __attribute__((overloadable)) NSOrderedSet *ASTShuffle(NSOrderedSet *set) {
    return __ASTShuffle_NSOrderedSet(set);
}
