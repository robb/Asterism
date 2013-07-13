//
//  ASTFind.m
//  Asterism
//
//  Created by Robert Böhnke on 6/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTFind.h"

OVERLOADABLE id ASTFind(NSArray *array, BOOL(^block)(id))
{
    NSUInteger index = [array indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }];

    return index == NSNotFound ? nil : array[index];
}

OVERLOADABLE id ASTFind(NSArray *array, BOOL(^block)(id, NSUInteger))
{
    NSUInteger index = [array indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj, idx);
    }];

    return index == NSNotFound ? nil : array[index];
}

OVERLOADABLE id ASTFind(NSDictionary *dict, BOOL(^block)(id))
{
    for (id key in dict) {
        id value = dict[key];

        if (block(value)) return value;
    }

    return nil;
}

OVERLOADABLE id ASTFind(NSDictionary *dict, BOOL(^block)(id, id))
{
    for (id key in dict) {
        id value = dict[key];

        if (block(key, value)) return value;
    }

    return nil;
}

OVERLOADABLE id ASTFind(id<NSFastEnumeration> collection, BOOL(^block)(id obj))
{
    for (id obj in collection) {
        if (block(obj)) return obj;
    }

    return nil;
}
