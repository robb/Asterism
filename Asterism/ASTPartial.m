//
//  ASTPartial.h
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#include "ASTPartial.h"

#define ASTPartial_parameter_(INDEX, MAX) \
        id metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define ASTPartial_parameters_(COUNT) \
        metamacro_for_cxt(COUNT, ASTPartial_parameter_,, COUNT)

#define ASTPartial_named_parameter_(INDEX, MAX) \
        id metamacro_concat(arg, INDEX)\
        metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define ASTPartial_named_parameters_(COUNT) \
        metamacro_for_cxt(COUNT, ASTPartial_named_parameter_,, COUNT)

#define ASTPartial_argument_(INDEX, MAX) \
        metamacro_concat(arg, INDEX) \
        metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define ASTPartial_arguments_(COUNT) \
        metamacro_for_cxt(COUNT, ASTPartial_argument_,, COUNT)

#define ASTPartial(ARG_COUNT) \
        OVERLOADABLE id (^ASTPartial(id(^block)(ASTPartial_parameters_(ARG_COUNT)), id obj))(ASTPartial_parameters_(metamacro_dec(ARG_COUNT))) \
        { \
            return ^id (ASTPartial_named_parameters_(metamacro_dec(ARG_COUNT))) { \
                metamacro_if_eq(1, ARG_COUNT) \
                    (return block(obj);) \
                    (return block(obj, ASTPartial_arguments_(metamacro_dec(ARG_COUNT)));) \
            }; \
        }

#define ASTPartialRight(ARG_COUNT) \
        OVERLOADABLE id (^ASTPartialRight(id(^block)(ASTPartial_parameters_(ARG_COUNT)), id obj))(ASTPartial_parameters_(metamacro_dec(ARG_COUNT))) \
        { \
            return ^id (ASTPartial_named_parameters_(metamacro_dec(ARG_COUNT))) { \
                metamacro_if_eq(1, ARG_COUNT) \
                    (return block(obj);) \
                    (return block(ASTPartial_arguments_(metamacro_dec(ARG_COUNT)), obj);) \
            }; \
        }

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
