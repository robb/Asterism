//
//  ASTWithout.m
//  Asterism
//
//  Created by Robert Böhnke on 19/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTReject.h"

#import "ASTWithout.h"

OVERLOADABLE NSArray *ASTWithout(NSArray *collection, id obj) {
    return ASTReject(collection, ^BOOL(id other) {
        return [obj isEqual:other];
    });
}

OVERLOADABLE NSSet *ASTWithout(NSSet *set, id obj) {
    return ASTReject(set, ^BOOL(id other) {
        return [obj isEqual:other];
    });
}

OVERLOADABLE NSOrderedSet *ASTWithout(NSOrderedSet *set, id obj) {
    return ASTReject(set, ^BOOL(id other) {
        return [obj isEqual:other];
    });
}
