//
//  AsterismHead.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismHead.h"

OVERLOADABLE id head(NSArray *array)
{
    return array.count > 0 ? array[0] : nil;
}
