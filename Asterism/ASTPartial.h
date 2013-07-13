//
//  ASTPartial.h
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "metamacros.h"

#import "ASTConstants.h"

// This header declares a number of functions called ASTPartial and
// ASTPartialRight.
//
// ASTPartial and ASTPartialRight each take two arguments.
//
// block - A block of arrity n. This parameter must not be nil.
// obj   - An object.
//
// Both return a new block of arrity (n-1) by partially applying `obj` to block.
// ASTPartial applies `obj` as the first argument of `block` whereas
// ASTPartialRight applies `obj` as the last argument of `block`.

#define ASTPartial_parameter_(INDEX, MAX) \
        id metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define ASTPartial_parameters_(COUNT) \
        metamacro_for_cxt(COUNT, ASTPartial_parameter_,, COUNT)

#define ASTPartial(ARG_COUNT) \
        OVERLOADABLE id (^ASTPartial(id(^block)(ASTPartial_parameters_(ARG_COUNT)), id obj))(ASTPartial_parameters_(metamacro_dec(ARG_COUNT)));

#define ASTPartialRight(ARG_COUNT) \
        OVERLOADABLE id (^ASTPartialRight(id(^block)(ASTPartial_parameters_(ARG_COUNT)), id obj))(ASTPartial_parameters_(metamacro_dec(ARG_COUNT)));

ASTPartial(1)
ASTPartial(2)
ASTPartial(3)
ASTPartial(4)
ASTPartial(5)
ASTPartial(6)

ASTPartialRight(1)
ASTPartialRight(2)
ASTPartialRight(3)
ASTPartialRight(4)
ASTPartialRight(5)
ASTPartialRight(6)

#undef ASTPartial_parameter_
#undef ASTPartial_parameters_

#undef ASTPartial
#undef ASTPartialRight
