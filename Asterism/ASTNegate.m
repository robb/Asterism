//
//  ASTNegate.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "metamacros.h"

#import "ASTNegate.h"

#define ASTNegate_parameter(INDEX, MAX, TYPE) \
        TYPE metamacro_concat(arg, INDEX) \
        metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define ASTNegate_parameters(...) \
        metamacro_foreach_cxt(ASTNegate_parameter, , metamacro_argcount(__VA_ARGS__), __VA_ARGS__)

#define ASTNegate_argument(INDEX, MAX, TYPE) \
        metamacro_concat(arg, INDEX) \
        metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define ASTNegate_arguments(...) \
        metamacro_foreach_cxt(ASTNegate_argument, , metamacro_argcount(__VA_ARGS__), __VA_ARGS__)

#define ASTNegate(...) \
        OVERLOADABLE BOOL (^ASTNegate(BOOL(^block)(__VA_ARGS__)))(__VA_ARGS__) \
        { \
            NSCParameterAssert(block != nil);\
            return ^BOOL (ASTNegate_parameters(__VA_ARGS__)) {\
                return !block(ASTNegate_arguments(__VA_ARGS__)); \
            }; \
        }

ASTNegate(id)
ASTNegate(id, NSUInteger)
ASTNegate(id, id)
