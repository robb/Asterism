//
//  ASTAny.h
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

// You should not call these methods directly.
BOOL __ASTAny_NSFastEnumeration(id<NSFastEnumeration> collection, BOOL(^block)(id obj));

// Tests if any element in a collection passes a test.
//
// collection - a collection of elements.
// block      - A block that takes an element as its only argument and returns
//              `YES` if the element passes the test. The block must no be nil.
//
// Returns `YES` if any of the elements in `collection` passes the test `block`.
static inline __attribute__((overloadable)) BOOL ASTAny(id<NSFastEnumeration> collection, BOOL(^block)(id obj)) {
    return __ASTAny_NSFastEnumeration(collection, block);
}
