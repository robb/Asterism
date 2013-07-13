//
//  ASTNegate.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Negates a block.
//
// block - takes a single argument of type id and returns a BOOL.
//         This argument must not be nil.
//
// Returns a new block of the same type that returns the opposite of what
// `block` returns.
OVERLOADABLE BOOL (^ASTNegate(BOOL(^block)(id)))(id);

// Negates a block.
//
// block - takes two arguments of type id and returns a BOOL.
//         This argument must not be nil.
//
// Returns a new block of the same type that returns the opposite of what
// `block` returns.
OVERLOADABLE BOOL (^ASTNegate(BOOL(^block)(id, id)))(id, id);

// Negates a block.
//
// block - takes an argument of type id and one of type NSUInteger and returns
//         a BOOL.
//         This argument must not be nil.
//
// Returns a new block of the same type that returns the opposite of what
// `block` returns.
OVERLOADABLE BOOL (^ASTNegate(BOOL(^block)(id, NSUInteger)))(id, NSUInteger);
