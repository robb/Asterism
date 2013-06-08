//
//  AsterismLift.h
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "metamacros.h"

typedef id (^ASTBlockVar)(id va, ...);

ASTBlockVar lift_var(SEL selector);

#define lift_noargs(SELECTOR) \
        lift_noargs_(SELECTOR)

#define lift(...) \
        lift_(__VA_ARGS__)

// IMPLEMENTATION DETAILS FOLLOW!
// Do not write code that depends on anything below this line.

#define lift_noargs_(SELECTOR) \
        ((id (^)(id))lift_var(@selector(SELECTOR)))

#define lift_parameter_(INDEX, MAX) \
        metamacro_if_eq(INDEX, metamacro_dec(MAX)) \
            (id) \
            (id, )

#define lift_parameters_(COUNT) \
        metamacro_for_cxt(COUNT, lift_parameter_,, COUNT)

#define lift_block_signature(...) \
        id(^)(lift_parameters_(metamacro_inc(metamacro_argcount(__VA_ARGS__))))

#define lift_(...) \
        ((lift_block_signature(__VA_ARGS__)) lift_var(@selector(metamacro_foreach_concat(,,__VA_ARGS__))))
