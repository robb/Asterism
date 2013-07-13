//
//  ASTIntersection.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTIntersection.h"

OVERLOADABLE NSArray *ASTIntersection(NSArray *array, NSArray *other)
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(other != nil);

    NSMutableArray *result = [array mutableCopy];

    for (id obj in array) {
        if (![other containsObject:obj]) {
            [result removeObject:obj];
        }
    }

    return [result copy];
}

OVERLOADABLE NSSet *ASTIntersection(NSSet *set, NSSet *other)
{
    NSCParameterAssert(set != nil);
    NSCParameterAssert(other != nil);

    NSMutableSet *result = [set mutableCopy];
    [result intersectSet:other];

    return [result copy];
}
