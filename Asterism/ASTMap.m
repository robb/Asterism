//
//  ASTMap.m
//  Asterism
//
//  Created by Robert Böhnke on 5/22/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTEach.h"

#import "ASTMap.h"

#pragma mark - Arrays

OVERLOADABLE NSArray *ASTMap(NSArray *array, id(^block)(id obj)) {
    NSCParameterAssert(block != nil);

    if (array == nil) return nil;

    return ASTMap(array, ^(id obj, NSUInteger _) {
        return block(obj);
    });
}

OVERLOADABLE NSArray *ASTMap(NSArray *array, id(^block)(id obj, NSUInteger idx)) {
    NSCParameterAssert(block != nil);

    if (array == nil) return nil;

    NSMutableArray *result = [NSMutableArray array];

    ASTEach(array, ^(id obj, NSUInteger idx) {
        id transformed = block(obj, idx);

        if (transformed != nil) {
            [result addObject:transformed];
        }
    });

    return result;
}

OVERLOADABLE NSDictionary *ASTMap(NSDictionary *dict, id(^block)(id obj)) {
    NSCParameterAssert(block != nil);

    if (dict == nil) return nil;

    return ASTMap(dict, ^(id _, id obj) {
        return block(obj);
    });
}

OVERLOADABLE NSDictionary *ASTMap(NSDictionary *dict, id(^block)(id key, id obj)) {
    NSCParameterAssert(block != nil);

    if (dict == nil) return nil;

    NSMutableDictionary *result = [NSMutableDictionary dictionary];

    ASTEach(dict, ^(id key, id obj) {
        id transformed = block(key, obj);

        if (transformed != nil) {
            result[key] = transformed;
        }
    });

    return result;
}

OVERLOADABLE NSSet *ASTMap(NSSet *set, id(^block)(id obj)) {
    NSCParameterAssert(block != nil);

    if (set == nil) return nil;

    NSMutableSet *result = [NSMutableSet set];

    ASTEach(set, ^(id obj) {
        id transformed = block(obj);

        if (transformed != nil) {
            [result addObject:transformed];
        }
    });

    return result;
}

OVERLOADABLE NSOrderedSet *ASTMap(NSOrderedSet *set, id(^block)(id obj)) {
    NSCParameterAssert(block != nil);

    if (set == nil) return nil;

    return ASTMap(set, ^(id obj, NSUInteger _) {
        return block(obj);
    });
}

OVERLOADABLE NSOrderedSet *ASTMap(NSOrderedSet *set, id(^block)(id obj, NSUInteger idx)) {
    NSCParameterAssert(block != nil);

    if (set == nil) return nil;

    NSMutableOrderedSet *result = [NSMutableOrderedSet orderedSet];

    ASTEach(set, ^(id obj, NSUInteger idx) {
        id transformed = block(obj, idx);

        if (transformed != nil) {
            [result addObject:transformed];
        }
    });

    return result;
}
