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
    if (array == nil && other == nil) return nil;
    if (array == nil) return other;
    if (other == nil) return array;

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
    if (set == nil && other == nil) return nil;
    if (set == nil) return other;
    if (other == nil) return set;

    NSMutableSet *result = [set mutableCopy];
    [result intersectSet:other];

    return [result copy];
}

OVERLOADABLE NSOrderedSet *ASTIntersection(NSOrderedSet *set, NSOrderedSet *other)
{
    if (set == nil && other == nil) return nil;
    if (set == nil) return other;
    if (other == nil) return set;

    NSMutableOrderedSet *result = [set mutableCopy];
    [result intersectOrderedSet:other];

    return [result copy];
}
