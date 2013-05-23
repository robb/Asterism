//
// Created by Robert Böhnke on 5/25/13.
// Copyright (c) 2013 Robert Böhnke. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#include "AsterismPartial.h"

OVERLOADABLE ASTBlock0 partial(id value, ASTBlock1 block)
{
    return ^{
        return block(value);
    };
}

OVERLOADABLE ASTBlock1 partial(id value, ASTBlock2 block)
{
    return ^(id arg2){
        return block(value, arg2);
    };
}

OVERLOADABLE ASTBlock2 partial(id value, ASTBlock3 block)
{
    return ^(id arg2, id arg3) {
        return block(value, arg2, arg3);
    };
}

OVERLOADABLE ASTBlock3 partial(id value, ASTBlock4 block)
{
    return ^(id arg2, id arg3, id arg4) {
        return block(value, arg2, arg3, arg4);
    };
}

OVERLOADABLE ASTBlock4 partial(id value, ASTBlock5 block)
{
    return ^(id arg2, id arg3, id arg4, id arg5) {
        return block(value, arg2, arg3, arg4, arg5);
    };
}

OVERLOADABLE ASTBlock5 partial(id value, ASTBlock6 block)
{
    return ^(id arg2, id arg3, id arg4, id arg5, id arg6) {
        return block(value, arg2, arg3, arg4, arg5, arg6);
    };
}