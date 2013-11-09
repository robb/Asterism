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
    NSCParameterAssert(array != nil);
    NSCParameterAssert(other != nil);

    return [array arrayByAddingObjectsFromArray:ASTDifference(other, array)];
}

OVERLOADABLE NSSet *ASTUnion(NSSet *set, NSSet *other)
{
    NSCParameterAssert(set != nil);
    NSCParameterAssert(other != nil);

    return [set setByAddingObjectsFromSet:other];
}

OVERLOADABLE NSOrderedSet *ASTUnion(NSOrderedSet *set, NSOrderedSet *other)
{
    NSCParameterAssert(set != nil);
    NSCParameterAssert(other != nil);

    NSMutableOrderedSet *result = [set mutableCopy];
    [result unionOrderedSet:other];

    return result;
}
