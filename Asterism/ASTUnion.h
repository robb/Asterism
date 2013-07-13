//
//  ASTUnion.h
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Returns the union of two arrays.
//
// array - An array of elements. This argument must not be nil.
// other - An array of elements. This argument must not be nil.
//
// Returns an array containing all elements of `array`, concatenated with all
// elements of `other` not already present in `array`. The order is being
// maintained.
OVERLOADABLE NSArray *ASTUnion(NSArray *array, NSArray *other);

// Returns the union two sets.
//
// set   - A set of elements. This argument must not be nil.
// other - A set of elements. This argument must not be nil.
//
// Returns a set containing the elements of `set` and `other`.
OVERLOADABLE NSSet *ASTUnion(NSSet *set, NSSet *other);
