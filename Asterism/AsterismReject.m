//
//  AsterismReject.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "metamacros.h"

#import "ASTFilter.h"
#import "ASTNegate.h"

#import "AsterismReject.h"

OVERLOADABLE NSArray *reject(NSArray *array, BOOL(^block)(id))
{
    return ASTFilter(array, ASTNegate(block));
}

OVERLOADABLE NSArray *reject(NSArray *array, BOOL(^block)(id, NSUInteger))
{
    return ASTFilter(array, ASTNegate(block));
}

OVERLOADABLE NSDictionary *reject(NSDictionary *dict, BOOL(^block)(id))
{
    return ASTFilter(dict, ASTNegate(block));
}

OVERLOADABLE NSDictionary *reject(NSDictionary *dict, BOOL(^block)(id key, id obj))
{
    return ASTFilter(dict, ASTNegate(block));
}

OVERLOADABLE NSSet *reject(NSSet *set, BOOL(^block)(id obj))
{
    return ASTFilter(set, ASTNegate(block));
}
