//
//  ASTIntersection.h
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Returns the intersection of two arrays.
//
// array - An array of elements. This argument must not be nil.
// other - An array of elements. This argument must not be nil.
//
// Returns an array containing the elements of `array` that are also present in
// `other`. The order is being maintained.
OVERLOADABLE NSArray *ASTIntersection(NSArray *array, NSArray *other);

// Returns the difference between two sets.
//
// set   - A set of elements. This argument must not be nil.
// other - A set of elements. This argument must not be nil.
//
// Returns a set containing the elements of `set` that are also present in
// `other`.
OVERLOADABLE NSSet *ASTIntersection(NSSet *set, NSSet *other);

// Returns the difference between two ordered sets.
//
// set   - An ordered set of elements. This argument must not be nil.
// other - An ordered set of elements. This argument must not be nil.
//
// Returns a set containing the elements of `set` that are also present in
// `other`. The order is being maintained.
OVERLOADABLE NSOrderedSet *ASTIntersection(NSOrderedSet *set, NSOrderedSet *other);
