//
//  ASTPluck.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTMap.h"

#import "ASTPluck.h"

OVERLOADABLE NSArray *ASTPluck(NSArray *array, NSString *keyPath)
{
    return ASTMap(array, ^id(id obj) {
        return [obj valueForKeyPath:keyPath];
    });
}

OVERLOADABLE NSSet *ASTPluck(NSSet *set, NSString *keyPath)
{
    return ASTMap(set, ^id(id obj) {
        return [obj valueForKeyPath:keyPath];
    });
}
