//
//  AsterismPartial.h
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "metamacros.h"

#import "AsterismConstants.h"

#define parameter_(INDEX, MAX) \
        id metamacro_if_eq(INDEX, metamacro_dec(MAX))()(,)

#define parameters_(COUNT) \
        metamacro_for_cxt(COUNT, parameter_,, COUNT)

#define partial(ARG_COUNT) \
        OVERLOADABLE id (^partial(id(^block)(parameters_(ARG_COUNT)), id obj))(parameters_(metamacro_dec(ARG_COUNT)));

#define partialRight(ARG_COUNT) \
        OVERLOADABLE id (^partialRight(id(^block)(parameters_(ARG_COUNT)), id obj))(parameters_(metamacro_dec(ARG_COUNT)));

partial(1)
partial(2)
partial(3)
partial(4)
partial(5)
partial(6)

partialRight(1)
partialRight(2)
partialRight(3)
partialRight(4)
partialRight(5)
partialRight(6)

#undef parameter_
#undef parameters_

#undef partial
#undef partialRight
