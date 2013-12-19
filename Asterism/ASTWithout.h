//
//  ASTWithout.h
//  Asterism
//
//  Created by Robert Böhnke on 19/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Filters out the elements of an array that are equal to a given value.
//
// array - An array of elements.
// obj   - An element to be removed.
//
// Returns an array of all values in `array` that are equal to `obj`. The order
// is being maintained.
OVERLOADABLE NSArray *ASTWithout(NSArray *array, id obj);

// Filters out the elements of a set that are equal to a given value.
//
// set - A set of elements.
// obj - An element to be removed.
//
// Returns a set of all values in `set` that are equal to `obj`.
OVERLOADABLE NSSet *ASTWithout(NSSet *set, id obj);

// Filters out the elements of an ordered set that are equal to a given value.
//
// set - An ordered set of elements.
// obj - An element to be removed.
//
// Returns an ordered set of all values in `set` that are equal to `obj`. The order
// is being maintained.
OVERLOADABLE NSOrderedSet *ASTWithout(NSOrderedSet *set, id obj);
