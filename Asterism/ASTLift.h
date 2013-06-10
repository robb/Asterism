//
//  ASTLift.h
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "metamacros.h"

typedef id (^ASTBlockVar)(id va, ...);

ASTBlockVar ASTLiftVar(SEL selector);

#define ASTLift0(SELECTOR) \
        ASTLift0_(SELECTOR)

#define ASTLift(...) \
        ASTLift_(__VA_ARGS__)

// IMPLEMENTATION DETAILS FOLLOW!
// Do not write code that depends on anything below this line.

#define ASTLift0_(SELECTOR) \
        ((id (^)(id))ASTLiftVar(@selector(SELECTOR)))

#define ASTLift_parameter_(INDEX, MAX) \
        metamacro_if_eq(INDEX, metamacro_dec(MAX)) \
            (id) \
            (id, )

#define ASTLift_parameters_(COUNT) \
        metamacro_for_cxt(COUNT, ASTLift_parameter_,, COUNT)

#define ASTLift_block_signature(...) \
        id(^)(ASTLift_parameters_(metamacro_inc(metamacro_argcount(__VA_ARGS__))))

#define ASTLift_(...) \
        ((ASTLift_block_signature(__VA_ARGS__)) ASTLiftVar(@selector(metamacro_foreach_concat(,,__VA_ARGS__))))
