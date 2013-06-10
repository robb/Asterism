//
//  ASTReduce.h
//  Asterism
//
//  Created by Robert Böhnke on 5/26/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

OVERLOADABLE id ASTReduce(id<NSFastEnumeration> collection, id(^block)(id memo, id obj));
OVERLOADABLE id ASTReduce(id<NSFastEnumeration> collection, id memo, id(^block)(id memo, id obj));
