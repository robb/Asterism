//
//  ASTGroup.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTGroup.h"

OVERLOADABLE NSDictionary *ASTGroup(id<NSFastEnumeration> collection, id<NSCopying> (^block)(id)) {
    NSCParameterAssert(block != nil);

    if (collection == nil) return nil;

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    for (id obj in collection) {
        id<NSCopying> key = block(obj);

        if (key == nil) continue;

        NSSet *group = dictionary[key] ?: [NSSet set];

        dictionary[key] = [group setByAddingObject:obj];
    }

    return [dictionary copy];
}

OVERLOADABLE NSDictionary *ASTGroup(id<NSFastEnumeration> collection, NSString *keyPath) {
    NSCParameterAssert(keyPath != nil);

    return ASTGroup(collection, ^(id obj) {
        return [obj valueForKeyPath:keyPath];
    });
}
