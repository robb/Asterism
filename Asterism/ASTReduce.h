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
id __ASTReduce_NSFastEnumeration_block(id<NSFastEnumeration> collection, id(^block)(id memo, id obj));
id __ASTReduce_NSFastEnumeration_memo_block(id<NSFastEnumeration> collection, id memo, id(^block)(id memo, id obj));

// Reduces a collection to a single value.
//
// collection - An object that implements NSFastEnumeration.
// block      - A block that takes two arguments and returns an object.
//              The first argument is its last return value or the first element
//              in the `collection` when it is called for the first time.
//              The second argument is the next value in the collection,
//              starting with the second one.
//              The block must not be nil.
//
// Returns the last return value of `block` once it reached the end of
// `collection`. If `collection` has only one element, `block` is never invoked
// and the first element is returned. If `collection` is empty, nil is returned.
//
// Example
//
//     NSString *(^concat)(NSString *, NSString *) = ^(NSString *a, NSString *b) {
//         return [a stringByAppendingString:b];
//     };
//
//     // Equivalent to [@"a" stringByAppendingString:@"b"];
//     ASTReduce(@[ @"a", @"b" ], concat);
//
//     // Equivalent to [[@"a" stringByAppendingString:@"b"] stringByAppendingString:@"c"];
//     ASTReduce(@[ @"a", @"b", @"c" ], concat);
//
ASTERISM_OVERLOADABLE id ASTReduce(id<NSFastEnumeration> collection, id(^block)(id memo, id obj)) {
    return __ASTReduce_NSFastEnumeration_block(collection, block);
}

// Reduces a collection to a single value.
//
// collection - An object that implements NSFastEnumeration.
// memo       - The first argument to `block` when it is invoked for the first
//              time.
// block      - A block that takes two arguments and returns an object.
//              The first argument is its last return value or `memo` when it
//              is called for the first time.
//              The second argument is the next value in the collection,
//              starting with the first.
//              The block must not be nil.
//
// Returns the last return value of `block` once it reached the end of
// `collection`. If `collection` is empty, `memo` is returned.
ASTERISM_OVERLOADABLE id ASTReduce(id<NSFastEnumeration> collection, id memo, id(^block)(id memo, id obj)) {
    return __ASTReduce_NSFastEnumeration_memo_block(collection, memo, block);
}
