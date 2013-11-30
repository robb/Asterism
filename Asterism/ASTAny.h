//
//  ASTAny.h
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTConstants.h"

// Tests if any element in a collection passes a test.
//
// collection - a collection of elements.
// block      - A block that takes an element as its only argument and returns
//              `YES` if the element passes the test. The block must no be nil.
//
// Returns `YES` if any of the elements in `collection` passes the test `block`.
OVERLOADABLE BOOL ASTAny(id<NSFastEnumeration> collection, BOOL(^block)(id obj));
