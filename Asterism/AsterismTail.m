//
//  AsterismTail.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismTail.h"

OVERLOADABLE NSArray *tail(NSArray *array)
{
    if (array.count <= 1) return @[];

    NSRange range = NSMakeRange(1, array.count - 1);

    return [array subarrayWithRange:range];
}
