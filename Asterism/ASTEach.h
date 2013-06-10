//
//  ASTEach.h
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismConstants.h"

OVERLOADABLE void ASTEach(NSArray *array, void(^iterator)(id obj));
OVERLOADABLE void ASTEach(NSArray *array, void(^iterator)(id obj, NSUInteger idx));

OVERLOADABLE void ASTEach(NSDictionary *dict, void(^iterator)(id obj));
OVERLOADABLE void ASTEach(NSDictionary *dict, void(^iterator)(id key, id obj));

OVERLOADABLE void ASTEach(id<NSFastEnumeration> enumerable, void(^iterator)(id obj));
