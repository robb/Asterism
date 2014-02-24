//
//  ASTIndexBy.m
//  Asterism
//
//  Created by Robert Böhnke on 14/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTGroup.h"
#import "ASTMap.h"
#import "ASTPluck.h"

#import "ASTIndexBy.h"

OVERLOADABLE NSDictionary *ASTIndexBy(id<NSFastEnumeration> collection, id<NSCopying> (^block)(id)) {
    return ASTMap(ASTGroup(collection, block), ^(id _, NSSet *group) {
        return group.anyObject;
    });
}

OVERLOADABLE NSDictionary *ASTIndexBy(id<NSFastEnumeration> collection, NSString *keyPath) {
    return ASTIndexBy(collection, ^(id obj) {
        return [obj valueForKeyPath:keyPath];
    });
}
