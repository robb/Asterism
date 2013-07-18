//
//  ASTEach.h
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Iterates over all elements of an array.
//
// array    - An array of elements. This argument must not be nil.
// iterator - A block that takes an element as its only argument. The block must
//            not be nil.
OVERLOADABLE void ASTEach(NSArray *array, void(^iterator)(id obj));

// Iterates over all elements of an array.
//
// array    - An array of elements. This argument must not be nil.
// iterator - A block that takes an element as its only argument and returns an
//            object. Its return value is discarded. The block must not be nil.
OVERLOADABLE void ASTEach(NSArray *array, id(^iterator)(id obj));

// Iterates over all elements of an array, as well as their indexes.
//
// array    - An array of elements. This argument must not be nil.
// iterator - A block that takes an element and its index in `array` as its
//            arguments. The block must not be nil.
OVERLOADABLE void ASTEach(NSArray *array, void(^iterator)(id obj, NSUInteger idx));

// Iterates over all values of a dictionary.
//
// dict     - A dictionary of elements. This argument must not be nil.
// iterator - A block that takes an element as its only argument. The block must
//            not be nil.
OVERLOADABLE void ASTEach(NSDictionary *dict, void(^iterator)(id obj));

// Iterates over all values of a dictionary.
//
// dict     - A dictionary of elements. This argument must not be nil.
// iterator - A block that takes an element as its only argument and returns an
//            object. Its return value is discarded. The block must not be nil.
OVERLOADABLE void ASTEach(NSDictionary *dict, id(^iterator)(id obj));

// Iterates over all keys and values of a dictionary.
//
// dict     - A dictionary of elements. This argument must not be nil.
// iterator - A block that takes a key and a value as its arguments. The block
//            must not be nil.
OVERLOADABLE void ASTEach(NSDictionary *dict, void(^iterator)(id key, id obj));

// Iterates over elements in a collection.
//
// enumerable - An object that implements NSFastEnumeration. This argument must
//              not be nil.
// iterator   - A block that takes an element as its only argument. The block
//              must not be nil.
OVERLOADABLE void ASTEach(id<NSFastEnumeration> enumerable, void(^iterator)(id obj));

// Iterates over elements in a collection.
//
// enumerable - An object that implements NSFastEnumeration. This argument must
//              not be nil.
// iterator   - A block that takes an element as its only argument and returns
//              an object. Its return value is discarded. The block must not be
//              nil.
OVERLOADABLE void ASTEach(id<NSFastEnumeration> enumerable, id(^iterator)(id obj));
