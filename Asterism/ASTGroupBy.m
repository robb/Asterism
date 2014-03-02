//
//  ASTGroupBy.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTGroupBy.h"

OVERLOADABLE NSDictionary *ASTGroupBy(id<NSFastEnumeration> collection, id<NSCopying> (^block)(id)) {
    NSCParameterAssert(block != nil);

    if (collection == nil) return nil;

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    for (id obj in collection) {
        id<NSCopying> key = block(obj);

        if (key == nil) continue;

        NSArray *group = dictionary[key] ?: @[];

        dictionary[key] = [group arrayByAddingObject:obj];
    }

    return dictionary;
}

OVERLOADABLE NSDictionary *ASTGroupBy(id<NSFastEnumeration> collection, NSString *keyPath) {
    NSCParameterAssert(keyPath != nil);

    return ASTGroupBy(collection, ^(id obj) {
        return [obj valueForKeyPath:keyPath];
    });
}
