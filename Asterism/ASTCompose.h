//
//  ASTCompose.h
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 7/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

#import "metamacros.h"

// ASTCompose applies one block to the result of another.
//
// Given two blocks `f` and `g`, ASTCompose returns a new block taking the
// arguments to `g` and applying `f` to the result of calling `g` with the
// given arguments. Mathematically: ASTCompose(f, g)(x, ...) = f(g(x, ...))
//
// Example:
//
//     ASTCompose(
//         ASTLift0(length),
//         ASTPartialRight(ASTLift(objectForKey:), @"foo")
//     )(@{ @"foo": @"bar" }) // == @3

#define ASTCompose_parameter_(INDEX, MAX) \
id metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define ASTCompose_parameters_(COUNT) \
metamacro_for_cxt(COUNT, ASTCompose_parameter_,, COUNT)

#define ASTCompose(ARG_COUNT) \
OVERLOADABLE id (^ASTCompose(id(^f)(id), id(^g)(ASTCompose_parameters_(ARG_COUNT))))(ASTCompose_parameters_(ARG_COUNT));

ASTCompose(1)
ASTCompose(2)
ASTCompose(3)
ASTCompose(4)
ASTCompose(5)
ASTCompose(6)

#undef ASTCompose_parameter_
#undef ASTCompose_parameters_

#undef ASTCompose
