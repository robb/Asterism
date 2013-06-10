//
//  ASTMinMax.h
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

OVERLOADABLE id ASTMin(id<NSFastEnumeration> collection);
OVERLOADABLE id ASTMin(id<NSFastEnumeration> collection, NSComparator comparator);
OVERLOADABLE id ASTMin(id<NSFastEnumeration> collection, NSNumber *(^comparator)(id a, id b));

OVERLOADABLE id ASTMax(id<NSFastEnumeration> collection);
OVERLOADABLE id ASTMax(id<NSFastEnumeration> collection, NSComparator comparator);
OVERLOADABLE id ASTMax(id<NSFastEnumeration> collection, NSNumber *(^comparator)(id a, id b));
