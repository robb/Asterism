//
//  ASTAll.m
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTAll.h"

OVERLOADABLE BOOL ASTAll(id<NSFastEnumeration> collection, BOOL(^block)(id)) {
    NSCParameterAssert(block != nil);

    BOOL didTest = NO;

    for (id obj in collection) {
        if (!block(obj)) return NO;

        didTest = YES;
    }

    return didTest;
}