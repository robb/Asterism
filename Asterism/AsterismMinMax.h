//
//  AsterismMinMax.h
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismConstants.h"

OVERLOADABLE id min(id<NSFastEnumeration> collection);
OVERLOADABLE id min(id<NSFastEnumeration> collection, NSComparator comparator);
OVERLOADABLE id min(id<NSFastEnumeration> collection, NSNumber *(^comparator)(id a, id b));

OVERLOADABLE id max(id<NSFastEnumeration> collection);
OVERLOADABLE id max(id<NSFastEnumeration> collection, NSComparator comparator);
OVERLOADABLE id max(id<NSFastEnumeration> collection, NSNumber *(^comparator)(id a, id b));
