//
//  ASTPluck.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTPluck.h"

OVERLOADABLE NSArray *ASTPluck(id<NSFastEnumeration> collection, NSString *keyPath)
{
    NSCParameterAssert(collection != nil);
    NSCParameterAssert(keyPath != nil);

    NSMutableArray *result = [NSMutableArray array];

    for (id obj in collection) {
        id value = [obj valueForKeyPath:keyPath];

        if (value != nil) {
            [result addObject:value];
        }
    }

    return result;
}
