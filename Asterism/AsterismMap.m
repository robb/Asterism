//
//  AsterismMap.m
//  Asterism
//
//  Created by Robert Böhnke on 5/22/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTEach.h"

#import "AsterismMap.h"

#pragma mark - Arrays

OVERLOADABLE NSArray *map(NSArray *array, id(^block)(id obj))
{
    return map(array, ^(id obj, NSUInteger _) {
        return block(obj);
    });
}

OVERLOADABLE NSArray *map(NSArray *array, id(^block)(id obj, NSUInteger idx))
{
    NSMutableArray *result = [NSMutableArray array];

    ASTEach(array, ^(id obj, NSUInteger idx) {
        id transformed = block(obj, idx);

        if (transformed != nil) {
            [result addObject:transformed];
        }
    });

    return result;
}

OVERLOADABLE NSDictionary *map(NSDictionary *dict, id(^block)(id obj))
{
    return map(dict, ^(id _, id obj) {
        return block(obj);
    });
}

OVERLOADABLE NSDictionary *map(NSDictionary *dict, id(^block)(id key, id obj))
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];

    ASTEach(dict, ^(id key, id obj) {
        id transformed = block(key, obj);

        if (transformed != nil) {
            result[key] = transformed;
        }
    });

    return result;
}

OVERLOADABLE NSSet *map(NSSet *set, id(^block)(id obj))
{
    NSMutableSet *result = [NSMutableSet set];

    ASTEach(set, ^(id obj) {
        id transformed = block(obj);

        if (transformed != nil) {
            [result addObject:transformed];
        }
    });

    return result;
}
