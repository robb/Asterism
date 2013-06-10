//
//  ASTNegate.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

OVERLOADABLE BOOL (^ASTNegate(BOOL(^block)(id)))(id);
OVERLOADABLE BOOL (^ASTNegate(BOOL(^block)(id, id)))(id, id);
OVERLOADABLE BOOL (^ASTNegate(BOOL(^block)(id, NSUInteger)))(id, NSUInteger);
