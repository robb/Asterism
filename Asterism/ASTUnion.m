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
    return [array arrayByAddingObjectsFromArray:ASTDifference(other, array)];
}

OVERLOADABLE NSSet *ASTUnion(NSSet *set, NSSet *other)
{
    return [set setByAddingObjectsFromSet:other];
}
