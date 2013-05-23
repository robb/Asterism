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

#define parameter_(INDEX, MAX) \
        metamacro_if_eq(INDEX, metamacro_dec(MAX)) \
            (id) \
            (id, )

#define parameters_(COUNT) \
        metamacro_for_cxt(COUNT, parameter_,, COUNT)

#define block_signature(...) \
        id(^)(parameters_(metamacro_inc(metamacro_argcount(__VA_ARGS__))))

#define lift_(...) \
        ((block_signature(__VA_ARGS__)) lift_var(@selector(metamacro_foreach_concat(,,__VA_ARGS__))))
