//
//  ASTNegate.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

// You should not call these methods directly.
BOOL (^__ASTNegate_id(BOOL(^block)(id)))(id);
BOOL (^__ASTNegate_id_id(BOOL(^block)(id, id)))(id, id);
BOOL (^__ASTNegate_id_NSUInteger(BOOL(^block)(id, NSUInteger)))(id, NSUInteger);

// Negates a block.
//
// block - takes a single argument of type id and returns a BOOL.
//         This argument must not be nil.
//
// Returns a new block of the same type that returns the opposite of what
// `block` returns.
static inline __attribute__((overloadable)) BOOL (^ASTNegate(BOOL(^block)(id)))(id) {
    return __ASTNegate_id(block);
}

// Negates a block.
//
// block - takes two arguments of type id and returns a BOOL.
//         This argument must not be nil.
//
// Returns a new block of the same type that returns the opposite of what
// `block` returns.
static inline __attribute__((overloadable)) BOOL (^ASTNegate(BOOL(^block)(id, id)))(id, id) {
    return __ASTNegate_id_id(block);
}

// Negates a block.
//
// block - takes an argument of type id and one of type NSUInteger and returns
//         a BOOL.
//         This argument must not be nil.
//
// Returns a new block of the same type that returns the opposite of what
// `block` returns.
static inline __attribute__((overloadable)) BOOL (^ASTNegate(BOOL(^block)(id, NSUInteger)))(id, NSUInteger) {
    return __ASTNegate_id_NSUInteger(block);
}
