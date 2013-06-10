//
//  AsterismReject.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "metamacros.h"

#import "ASTFilter.h"
#import "AsterismNegate.h"

#import "AsterismReject.h"

OVERLOADABLE NSArray *reject(NSArray *array, BOOL(^block)(id))
{
    return ASTFilter(array, negate(block));
}

OVERLOADABLE NSArray *reject(NSArray *array, BOOL(^block)(id, NSUInteger))
{
    return ASTFilter(array, negate(block));
}

OVERLOADABLE NSDictionary *reject(NSDictionary *dict, BOOL(^block)(id))
{
    return ASTFilter(dict, negate(block));
}

OVERLOADABLE NSDictionary *reject(NSDictionary *dict, BOOL(^block)(id key, id obj))
{
    return ASTFilter(dict, negate(block));
}

OVERLOADABLE NSSet *reject(NSSet *set, BOOL(^block)(id obj))
{
    return ASTFilter(set, negate(block));
}
