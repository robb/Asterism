//
//  ASTGroup.h
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

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
//     NSDictionary *grouped = ASTGroup(numbers, ^(NSNumber *number){
//         return number.integerValue % 2 == 0 ? @"even" : @"odd";
//     });
//
//     grouped[@"even"]; // { @2, @4 }
//     grouped[@"odd"];  // { @1, @3, @5 }
//
OVERLOADABLE NSDictionary *ASTGroup(id<NSFastEnumeration> collection, id<NSCopying> (^block)(id obj));

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
//     NSDictionary *grouped = ASTGroup(numbers, @"length");
//
//     grouped[@3]; // { @"foo", @"bar" }
//     grouped[@8]; // { @"surprise" }
//
OVERLOADABLE NSDictionary *ASTGroup(id<NSFastEnumeration> collection, NSString *keyPath);
