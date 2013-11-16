//
//  ASTUnion.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTDifference.h"

#import "ASTUnion.h"

OVERLOADABLE NSArray *ASTUnion(NSArray *array, NSArray *other)
{
    if (array == nil && other == nil) return nil;
    if (array == nil) return other;
    if (other == nil) return array;

    return [array arrayByAddingObjectsFromArray:ASTDifference(other, array)];
}

OVERLOADABLE NSSet *ASTUnion(NSSet *set, NSSet *other)
{
    if (set == nil && other == nil) return nil;
    if (set == nil) return other;
    if (other == nil) return set;

    return [set setByAddingObjectsFromSet:other];
}

OVERLOADABLE NSOrderedSet *ASTUnion(NSOrderedSet *set, NSOrderedSet *other)
{
    if (set == nil && other == nil) return nil;
    if (set == nil) return other;
    if (other == nil) return set;

    NSMutableOrderedSet *result = [set mutableCopy];
    [result unionOrderedSet:other];

    return result;
}
