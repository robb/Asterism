//
//  ASTFlatten.m
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 11/24/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTFlatten.h"

NSArray *ASTFlatten(NSArray *array) {
    NSMutableArray *result = [NSMutableArray array];

    for (NSArray *subarray in array) {
        [result addObjectsFromArray:subarray];
    }

    return result;
}
