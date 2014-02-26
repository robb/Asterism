//
//  ASTIndexBy.h
//  Asterism
//
//  Created by Robert Böhnke on 14/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Indexes the elements of a collection using a block.
//
// collection - An object that implements NSFastEnumeration.
// block      - A block that takes an element in `collection` as its only
//              argument and returns a key by which to index the element.
//              The return value is required to implement NSCopying.
//              The block must not be nil.
//
// Returns a dictionary that maps the keys returned by `block` to the respective
// input value. If `block` returns the same value for multiple values, an
// arbitrary value is chosen.
//
// Examples
//
//     NSArray *strings = @[ @"foo", @"bar" ];
//
//     NSDictionary *indexed = ASTIndex(strings, ^(NSString *string){
//         return @([string characterAtIndex:0]);
//     });
//
//     indexed[@"f"]; // @"foo"
//     indexed[@"b"]; // @"bar"
//
OVERLOADABLE NSDictionary *ASTIndexBy(id<NSFastEnumeration> collection, id<NSCopying> (^block)(id obj));

// Indexes the elements in a collection by their value for a given key path.
//
// collection - An object that implements NSFastEnumeration.
// key path   - A key path for which the elements in `collection` return either
//              an object that implements NSCopying or nil.
//              This parameter must not be nil.
//
// Returns a dictionary that maps the values the elements return for `keyPath`
// to the respective input value. Multiple values return the same value for
// `keyPath`, an arbitrary element is chosen.
//
// Examples
//
//     NSArray *strings = @[ @"a", @"ab", @"abc" ];
//
//     NSDictionary *indexed = ASTIndex(strings, @"length");
//
//     grouped[@1]; // @"a"
//     grouped[@2]; // @"ab"
//     grouped[@3]; // @"abc"
//
OVERLOADABLE NSDictionary *ASTIndexBy(id<NSFastEnumeration> collection, NSString *keyPath);
