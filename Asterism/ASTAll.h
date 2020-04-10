//
//  ASTAll.h
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTAll) BOOL __ASTAll_NSDictionary(NSDictionary *dict, BOOL(NS_NOESCAPE ^block)(id obj));
ASTERISM_USE_INSTEAD(ASTAll) BOOL __ASTAll_NSFastEnumeration(id<NSFastEnumeration> collection, BOOL(NS_NOESCAPE ^block)(id obj));

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Tests if all values in a dictionary pass a test.
///
/// @param dict  A dictionary of elements.
/// @param block A block that takes a value of @c dict as its only argument and
///              returns @c YES if the value passes the test. The block must no
///              be @c nil .
///
/// @returns @c YES if all values in @c dict pass the test @c block.
ASTERISM_OVERLOADABLE BOOL ASTAll(NSDictionary *dict, BOOL(NS_NOESCAPE ^block)(id obj)) {
    return __ASTAll_NSDictionary(dict, block);
}

/// Tests if all elements in a collection pass a test.
///
/// @param collection A collection of elements.
/// @param block      A block that takes an element as its only argument and
///                   returns @c YES if the element passes the test. The block
///                   must not be @c nil .
///
/// @returns @c YES if all elements in @c collection pass the test @c block.
ASTERISM_OVERLOADABLE BOOL ASTAll(id<NSFastEnumeration> collection, BOOL(NS_NOESCAPE ^block)(id obj)) {
    return __ASTAll_NSFastEnumeration(collection, block);
}

#pragma clang diagnostic pop
