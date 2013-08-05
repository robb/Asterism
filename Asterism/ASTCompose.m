//
//  ASTCompose.m
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 7/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTCompose.h"

#define ASTCompose_parameter_(INDEX, MAX) \
id metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define ASTCompose_parameters_(COUNT) \
metamacro_for_cxt(COUNT, ASTCompose_parameter_,, COUNT)

#define ASTCompose_named_parameter_(INDEX, MAX) \
id metamacro_concat(arg, INDEX) \
metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define ASTCompose_named_parameters_(COUNT) \
metamacro_for_cxt(COUNT, ASTCompose_named_parameter_,, COUNT)

#define ASTCompose_argument_(INDEX, MAX) \
metamacro_concat(arg, INDEX) \
metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define ASTCompose_arguments_(COUNT) \
metamacro_for_cxt(COUNT, ASTCompose_argument_,, COUNT)

#define ASTCompose(ARG_COUNT) \
OVERLOADABLE id (^ASTCompose(id(^f)(id), id(^g)(ASTCompose_parameters_(ARG_COUNT))))(ASTCompose_parameters_(ARG_COUNT)) \
{ \
    NSCParameterAssert(f != nil); \
    NSCParameterAssert(g != nil); \
    return ^id(ASTCompose_named_parameters_(ARG_COUNT)) { \
        return f(g(ASTCompose_arguments_(ARG_COUNT))); \
    }; \
}

ASTCompose(1)
ASTCompose(2)
ASTCompose(3)
ASTCompose(4)
ASTCompose(5)
ASTCompose(6)
