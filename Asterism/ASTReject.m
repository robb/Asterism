//
//  ASTReject.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "metamacros.h"

#import "ASTFilter.h"
#import "ASTNegate.h"

#import "ASTReject.h"

OVERLOADABLE NSArray *ASTReject(NSArray *array, BOOL(^block)(id))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(block != nil);

    return ASTFilter(array, ASTNegate(block));
}

OVERLOADABLE NSArray *ASTReject(NSArray *array, BOOL(^block)(id, NSUInteger))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(block != nil);

    return ASTFilter(array, ASTNegate(block));
}

OVERLOADABLE NSDictionary *ASTReject(NSDictionary *dict, BOOL(^block)(id))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(block != nil);

    return ASTFilter(dict, ASTNegate(block));
}

OVERLOADABLE NSDictionary *ASTReject(NSDictionary *dict, BOOL(^block)(id key, id obj))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(block != nil);

    return ASTFilter(dict, ASTNegate(block));
}

OVERLOADABLE NSSet *ASTReject(NSSet *set, BOOL(^block)(id obj))
{
    NSCParameterAssert(set != nil);
    NSCParameterAssert(block != nil);

    return ASTFilter(set, ASTNegate(block));
}
