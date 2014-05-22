//
//  ASTChain.h
//  Asterism
//
//  Created by Robert Böhnke on 22/05/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "metamacros.h"

#define ASTChain(...) \
    ASTChain_(__VA_ARGS__)

// IMPLEMENTATION DETAILS FOLLOW!
// Do not write code that depends on anything below this line.
#define ASTChain_Block_Open ({
#define ASTChain_Block_Close });

#define ASTChain_Block_Close_Iter(INDEX, CONTEXT) });

#define ASTFoo(INDEX, CONTEXT, ARG) \
    metamacro_if_eq(INDEX, metamacro_dec(CONTEXT)) \
        ( \
            ASTChain_Block_Open \
                ARG; \
            ASTChain_Block_Close \
            metamacro_for_cxt(metamacro_dec(CONTEXT), ASTChain_Block_Close_Iter, , ) \
        ) \
        ( \
            ASTChain_Block_Open \
                typeof ( ARG ) metamacro_concat(ASTChain_tmp_, INDEX) = ARG; \
                typeof ( ARG ) _ = metamacro_concat(ASTChain_tmp_, INDEX); \
        )

#define ASTChain_(...) \
    ({ \
        metamacro_foreach_cxt(ASTFoo, , metamacro_argcount(__VA_ARGS__), __VA_ARGS__) \
    })
