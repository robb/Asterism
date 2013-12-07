//
//  ASTSize.h
//  Asterism
//
//  Created by Robert Böhnke on 07/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// The number of values in an array.
//
// array - an array of elements.
//
// Returns the size of the `array`.
OVERLOADABLE NSUInteger ASTSize(NSArray *array);

// The number of values in a dictionary.
//
// dictionary - a dictionary set of elements.
//
// Returns the size of `dictionary`.
OVERLOADABLE NSUInteger ASTSize(NSDictionary *dictionary);

// The number of values in a set.
//
// set - a set of elements.
//
// Returns the size of `set`.
OVERLOADABLE NSUInteger ASTSize(NSSet *set);

// The number of values in an ordered set.
//
// set - an ordered set of elements.
//
// Returns the size of `set`.
OVERLOADABLE NSUInteger ASTSize(NSOrderedSet *set);

// Counts the number of elements in a collection.
//
// collection - a collection of elements.
//
// Returns the size of `collection` in O(n).
OVERLOADABLE NSUInteger ASTSize(id<NSFastEnumeration> collection);
