//
//  ASTAny.m
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTAny.h"

OVERLOADABLE BOOL ASTAny(id<NSFastEnumeration> collection, BOOL(^block)(id)) {
    NSCParameterAssert(block != nil);

    for (id obj in collection) {
        if (block(obj)) return YES;
    }

    return NO;
}
