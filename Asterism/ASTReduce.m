//
//  ASTReduce.m
//  Asterism
//
//  Created by Robert Böhnke on 5/26/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTReduce.h"

OVERLOADABLE id ASTReduce(id<NSFastEnumeration> collection, id(^block)(id memo, id obj))
{
    id current;

    BOOL firstRun = YES;
    for (id obj in collection) {
        if (firstRun) {
            current = obj;
            firstRun = NO;
            continue;
        }

        current = block(current, obj);
    }

    return current;
}

OVERLOADABLE id ASTReduce(id<NSFastEnumeration> collection, id memo, id(^block)(id memo, id obj))
{
    id current = memo;

    for (id obj in collection) {
        current = block(current, obj);
    }

    return current;
}
