//
//  ASTDifference.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTDifference.h"

OVERLOADABLE NSArray *ASTDifference(NSArray *array, NSArray *other)
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(other != nil);

    NSMutableArray *result = [array mutableCopy];

    [result removeObjectsInArray:other];

    return [result copy];
}

OVERLOADABLE NSSet *ASTDifference(NSSet *set, NSSet *other)
{
    NSCParameterAssert(set != nil);
    NSCParameterAssert(other != nil);

    NSMutableSet *result = [set mutableCopy];

    [result minusSet:other];

    return [result copy];
}
