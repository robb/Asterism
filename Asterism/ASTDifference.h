//
//  ASTDifference.h
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Returns the difference between two arrays.
//
// array - An array of elements. This argument must not be nil.
// other - An array of elements. This argument must not be nil.
//
// Returns an array containing the elements of `array` that are not present in
// `other`. The order is being maintained.
OVERLOADABLE NSArray *ASTDifference(NSArray *array, NSArray *other);

// Returns the difference between two sets.
//
// set   - A set of elements. This argument must not be nil.
// other - A set of elements. This argument must not be nil.
//
// Returns a set containing the elements of `set` that are not present in
// `other`.
OVERLOADABLE NSSet *ASTDifference(NSSet *set, NSSet *other);
