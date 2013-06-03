//
//  AsterismNegate.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "metamacros.h"

#import "AsterismNegate.h"

#define negate_parameter(INDEX, MAX, TYPE) \
        TYPE metamacro_concat(arg, INDEX) \
        metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define negate_parameters(...) \
        metamacro_foreach_cxt(negate_parameter, , metamacro_argcount(__VA_ARGS__), __VA_ARGS__)

#define negate_argument(INDEX, MAX, TYPE) \
        metamacro_concat(arg, INDEX) \
        metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define negate_arguments(...) \
        metamacro_foreach_cxt(negate_argument, , metamacro_argcount(__VA_ARGS__), __VA_ARGS__)

#define negate(...) \
        OVERLOADABLE BOOL (^negate(BOOL(^block)(__VA_ARGS__)))(__VA_ARGS__) \
        { \
            return ^BOOL (negate_parameters(__VA_ARGS__)) {\
                return !block(negate_arguments(__VA_ARGS__)); \
            }; \
        }

negate(id)
negate(id, NSUInteger)
negate(id, id)
