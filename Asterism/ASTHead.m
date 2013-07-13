//
//  ASTHead.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTHead.h"

OVERLOADABLE id ASTHead(NSArray *array)
{
    NSCParameterAssert(array != nil);

    return array.count > 0 ? array[0] : nil;
}
