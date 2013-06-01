//
//  AsterismReduce.h
//  Asterism
//
//  Created by Robert Böhnke on 5/26/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismConstants.h"

OVERLOADABLE id reduce(id<NSFastEnumeration> collection, id(^block)(id memo, id obj));
OVERLOADABLE id reduce(id<NSFastEnumeration> collection, id memo, id(^block)(id memo, id obj));

OVERLOADABLE id reduceRight(NSArray *array, id(^block)(id memo, id obj));
OVERLOADABLE id reduceRight(NSArray *array, id memo, id(^block)(id memo, id obj));

OVERLOADABLE id reduceRight(NSOrderedSet *set, id(^block)(id memo, id obj));
OVERLOADABLE id reduceRight(NSOrderedSet *set, id memo, id(^block)(id memo, id obj));
