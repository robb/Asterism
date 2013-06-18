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
    NSMutableSet *result = [set mutableCopy];
    [result intersectSet:other];

    return [result copy];
}
