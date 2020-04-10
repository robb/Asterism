//
//  ASTReduce.h
//  Asterism
//
//  Created by Robert Böhnke on 5/26/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTReduce) id __ASTReduce_NSDictionary_block(NSDictionary *dict, id(NS_NOESCAPE ^block)(id memo, id obj));
ASTERISM_USE_INSTEAD(ASTReduce) id __ASTReduce_NSDictionary_memo_block(NSDictionary *dict, id memo, id(NS_NOESCAPE ^block)(id memo, id obj));
ASTERISM_USE_INSTEAD(ASTReduce) id __ASTReduce_NSFastEnumeration_block(id<NSFastEnumeration> collection, id(NS_NOESCAPE ^block)(id memo, id obj));
ASTERISM_USE_INSTEAD(ASTReduce) id __ASTReduce_NSFastEnumeration_memo_block(id<NSFastEnumeration> collection, id memo, id(NS_NOESCAPE ^block)(id memo, id obj));

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Reduces a dictionary to a single value.
///
/// @param dict  An object that implements @c NSFastEnumeration .
/// @param block A block that takes two arguments and returns an object.
///              The first argument is its last return value or a value of
///              @c dict when it is called for the first time. The second
///              argument is the next value of @c dict .
///              The block must not be @c nil .
///
/// @returns The last return value of @c block once it reached the end of
///          @c dict . If @c dict has only one value, @c block is never invoked
///          and that value. If @c dict is empty, @c nil is returned.
ASTERISM_OVERLOADABLE id ASTReduce(NSDictionary *dict, id(NS_NOESCAPE ^block)(id memo, id obj)) {
    return __ASTReduce_NSDictionary_block(dict, block);
}

/// Reduces a dictionary to a single value.
///
/// @param dict  An object that implements @c NSFastEnumeration.
/// @param memo  The first argument to @c block when it is invoked for the first time.
/// @param block A block that takes two arguments and returns an object. The
///              first argument is its last return value or @c memo when it is
///              called for the first time. The second argument is the next
///              value of @c dict .
///              The block must not be @c nil .
///
/// @returns The last return value of @c block once it reached the end of
///          @c dict. If @c dict is empty, @c memo is returned.
ASTERISM_OVERLOADABLE id ASTReduce(NSDictionary *dict, id memo, id(NS_NOESCAPE ^block)(id memo, id obj)) {
    return __ASTReduce_NSDictionary_memo_block(dict, memo, block);
}

/// Reduces a collection to a single value.
///
/// @param collection An object that implements @c NSFastEnumeration .
/// @param block      A block that takes two arguments and returns an object.
///                   The first argument is its last return value or the first
///                   element in the @c collection when it is called for the
///                   first time. The second argument is the next value in the
///                   collection, starting with the second one.
///                   The block must not be @c nil .
///
/// @returns The last return value of @c block once it reached the end of
///          @c collection. If @c collection has only one element, @c block is
///          never invoked and the first element is returned.
///          If @c collection is empty, @c nil is returned.
///
/// Example
/// @code
/// NSString *(NS_NOESCAPE ^concat)(NSString *, NSString *) = ^(NSString *a, NSString *b) {
///     return [a stringByAppendingString:b];
/// };
///
/// // Equivalent to [@"a" stringByAppendingString:@"b"];
/// ASTReduce(@[ @"a", @"b" ], concat);
///
/// // Equivalent to [[@"a" stringByAppendingString:@"b"] stringByAppendingString:@"c"];
/// ASTReduce(@[ @"a", @"b", @"c" ], concat);
/// @endcode
ASTERISM_OVERLOADABLE id ASTReduce(id<NSFastEnumeration> collection, id(NS_NOESCAPE ^block)(id memo, id obj)) {
    return __ASTReduce_NSFastEnumeration_block(collection, block);
}

/// Reduces a collection to a single value.
///
/// @param collection An object that implements @c NSFastEnumeration.
/// @param memo       The first argument to @c block when it is invoked for the
///                   first time.
/// @param block      A block that takes two arguments and returns an object.
///                   The first argument is its last return value or @c memo
///                   when it is called for the first time. The second argument
///                   is the next value in the collection, starting with the
///                   first. The block must not be @c nil .
///
/// @returns The last return value of @c block once it reached the end of
///          @c collection. If @c collection is empty, @c memo is returned.
ASTERISM_OVERLOADABLE id ASTReduce(id<NSFastEnumeration> collection, id memo, id(NS_NOESCAPE ^block)(id memo, id obj)) {
    return __ASTReduce_NSFastEnumeration_memo_block(collection, memo, block);
}

#pragma clang diagnostic pop
