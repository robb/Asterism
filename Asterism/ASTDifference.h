//
//  ASTDifference.h
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

// You should not call these methods directly.
NSArray *__ASTDifference_NSArray(NSArray *array, NSArray *other);
NSSet *__ASTDifference_NSSet(NSSet *set, NSSet *other);
NSOrderedSet *__ASTDifference_NSOrderedSet(NSOrderedSet *set, NSOrderedSet *other);

// Returns the difference between two arrays.
//
// array - An array of elements.
// other - An array of elements.
//
// Returns an array containing the elements of `array` that are not present in
// `other`. The order is being maintained.
static inline __attribute__((overloadable)) NSArray *ASTDifference(NSArray *array, NSArray *other) {
    return __ASTDifference_NSArray(array, other);
}

// Returns the difference between two sets.
//
// set   - A set of elements.
// other - A set of elements.
//
// Returns a set containing the elements of `set` that are not present in
// `other`.
static inline __attribute__((overloadable)) NSSet *ASTDifference(NSSet *set, NSSet *other) {
    return __ASTDifference_NSSet(set, other);
}

// Returns the difference between two ordered sets.
//
// set   - An ordered set of elements.
// other - An ordered set of elements.
//
// Returns an ordered set containing the elements of `set` that are not present
// in `other`.
static inline __attribute__((overloadable)) NSOrderedSet *ASTDifference(NSOrderedSet *set, NSOrderedSet *other) {
    return __ASTDifference_NSOrderedSet(set, other);
}
