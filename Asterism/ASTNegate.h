//
//  ASTNegate.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTNegate) BOOL (^__ASTNegate_id(NS_NOESCAPE BOOL(^block)(id)))(id);
ASTERISM_USE_INSTEAD(ASTNegate) BOOL (^__ASTNegate_id_id(NS_NOESCAPE BOOL(^block)(id, id)))(id, id);
ASTERISM_USE_INSTEAD(ASTNegate) BOOL (^__ASTNegate_id_NSUInteger(NS_NOESCAPE BOOL(^block)(id, NSUInteger)))(id, NSUInteger);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Negates a block.
///
/// @param block Takes a single argument of type @c id and returns a @c BOOL .
///              This argument must not be @c nil .
///
/// @returns A new block of the same type that returns the opposite of what
///          @c block returns.
ASTERISM_OVERLOADABLE BOOL (^ASTNegate(NS_NOESCAPE BOOL(^block)(id)))(id) {
    return __ASTNegate_id(block);
}

/// Negates a block.
///
/// @param block Takes two arguments of type @c id and returns a @c BOOL .
///              This argument must not be @c nil .
///
/// Returns a new block of the same type that returns the opposite of what
/// @c block returns.
ASTERISM_OVERLOADABLE BOOL (^ASTNegate(NS_NOESCAPE BOOL(^block)(id, id)))(id, id) {
    return __ASTNegate_id_id(block);
}

/// Negates a block.
///
/// @params block Takes an argument of type id and one of type @c NSUInteger
///               and returns a @c BOOL.
///               This argument must not be @c nil .
///
/// Returns a new block of the same type that returns the opposite of what
/// @c block returns.
ASTERISM_OVERLOADABLE BOOL (^ASTNegate(NS_NOESCAPE BOOL(^block)(id, NSUInteger)))(id, NSUInteger) {
    return __ASTNegate_id_NSUInteger(block);
}

#pragma clang diagnostic pop
