//
//  ASTAll.h
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

// You should not call these methods directly.
BOOL __ASTAll_NSFastEnumeration(id<NSFastEnumeration> collection, BOOL(^block)(id obj));

// Tests if all elements in a collection pass a test.
//
// collection - a collection of elements.
// block      - A block that takes an element as its only argument and returns
//              `YES` if the element passes the test. The block must no be nil.
//
// Returns `YES` if all elements in `collection` pass the test `block`.
static inline __attribute__((overloadable)) BOOL ASTAll(id<NSFastEnumeration> collection, BOOL(^block)(id obj)) {
    return __ASTAll_NSFastEnumeration(collection, block);
}
