//
//  ASTIndexOf.h
//  Asterism
//
//  Created by Robert Böhnke on 24/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Finds the index of an object in an array.
//
// array - An array of elements.
// obj   - The object to find.
//
// Returns the first index of obj in array or NSNotFound if the object could not
// be found.
OVERLOADABLE NSUInteger ASTIndexOf(NSArray *array, id obj);

// Finds the index of an object in an ordered set.
//
// set  - An ordered set of elements.
// obj The object to find.
//
// Returns the first index of obj in set or NSNotFound if the object could not
// be found.
OVERLOADABLE NSUInteger ASTIndexOf(NSOrderedSet *set, id obj);

// Finds the index of an object in a collection.
//
// collection - A collection of elements.
// obj        - The object to find.
//
// Returns the first index of obj in collection or NSNotFound if the object
// could not be found. If collection does not make a guarantee regarding its
// order, such as NSSet or NSDictionary, the meaning of the return value is
// undefined.
OVERLOADABLE NSUInteger ASTIndexOf(id<NSFastEnumeration> collection, id obj);
