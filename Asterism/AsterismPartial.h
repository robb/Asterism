//
//  AsterismPartial.h
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#define OVERLOADABLE __attribute__((overloadable))

typedef id (^ASTBlock0)(void);
typedef id (^ASTBlock1)(id arg1);
typedef id (^ASTBlock2)(id arg1, id arg2);
typedef id (^ASTBlock3)(id arg1, id arg2, id arg3);
typedef id (^ASTBlock4)(id arg1, id arg2, id arg3, id arg4);
typedef id (^ASTBlock5)(id arg1, id arg2, id arg3, id arg4, id arg5);
typedef id (^ASTBlock6)(id arg1, id arg2, id arg3, id arg4, id arg5, id arg6);

OVERLOADABLE ASTBlock0 partial(id value, ASTBlock1 block);
OVERLOADABLE ASTBlock1 partial(id value, ASTBlock2 block);
OVERLOADABLE ASTBlock2 partial(id value, ASTBlock3 block);
OVERLOADABLE ASTBlock3 partial(id value, ASTBlock4 block);
OVERLOADABLE ASTBlock4 partial(id value, ASTBlock5 block);
OVERLOADABLE ASTBlock5 partial(id value, ASTBlock6 block);
