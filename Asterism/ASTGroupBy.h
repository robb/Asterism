//
//  ASTGroupBy.h
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

// You should not call these methods directly.
NSDictionary *__ASTGroupBy_NSFastEnumeration_block(id<NSFastEnumeration> collection, id<NSCopying> (^block)(id obj));
NSDictionary *__ASTGroupBy_NSFastEnumeration_keyPath(id<NSFastEnumeration> collection, NSString *keyPath);

// Groups the elements in a collection using a block.
//
// collection - An object that implements NSFastEnumeration.
// block      - A block that takes an element in `collection` as its only
//              argument and returns a key by which to group the element.
//              The return value is required to implement NSCopying.
//              The block must not be nil.
//
// Returns a dictionary that maps the keys returned by `block` to a set of all
// values in `collection` that share the same key.
//
// Examples
//
//     NSArray *numbers = @[ @1, @2, @3, @4, @5 ];
//
//     NSDictionary *grouped = ASTGroupBy(numbers, ^(NSNumber *number){
//         return number.integerValue % 2 == 0 ? @"even" : @"odd";
//     });
//
//     grouped[@"even"]; // { @2, @4 }
//     grouped[@"odd"];  // { @1, @3, @5 }
//
static inline __attribute__((overloadable)) NSDictionary *ASTGroupBy(id<NSFastEnumeration> collection, id<NSCopying> (^block)(id obj)) {
    return __ASTGroupBy_NSFastEnumeration_block(collection, block);
}

// Groups the elements in a collection by their value for a given key path.
//
// collection - An object that implements NSFastEnumeration.
// key path   - A key path for which the elements in `collection` return either
//              an object that implements NSCopying or nil.
//              This parameter must not be nil.
//
// Returns a dictionary that maps the values the elements return for `keyPath`
// to a set of all values in `collection` that share the same key.
//
// Examples
//
//     NSArray *numbers = @[ @"foo", @"bar", @"surprise" ];
//
//     NSDictionary *grouped = ASTGroupBy(numbers, @"length");
//
//     grouped[@3]; // { @"foo", @"bar" }
//     grouped[@8]; // { @"surprise" }
//
static inline __attribute__((overloadable)) NSDictionary *ASTGroupBy(id<NSFastEnumeration> collection, NSString *keyPath) {
    return __ASTGroupBy_NSFastEnumeration_keyPath(collection, keyPath);
}
