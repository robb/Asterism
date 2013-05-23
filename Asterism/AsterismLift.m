//
//  AsterismLift.m
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "metamacros.h"

#import <objc/runtime.h>

#import "AsterismLift.h"

#define NSNUMBER_TYPES char, unsigned char, short, unsigned short, int,\
                       unsigned int, long, unsigned long, long long,\
                       unsigned long long, float, double, BOOL, NSUInteger,\
                       NSInteger

#define TYPE_EQUAL(OBJC_TYPE, TYPE_TO_ENCODE) \
    (strcmp(OBJC_TYPE, @encode(TYPE_TO_ENCODE)) == 0)

ASTBlockVar lift_var(SEL selector)
{
    __block const char *currentEncoding = "";
    __block NSInvocation *invocation;
    __block NSMethodSignature *signature;

    return ^id(id _self, ...) {
        Method method = class_getInstanceMethod([_self class], selector);

        if (method == NULL) {
            [NSException raise:NSInternalInconsistencyException
                        format:@"%@ does not implement %@", [_self class], NSStringFromSelector(selector)];
        }

        const char *encoding = method_getTypeEncoding(method);

        if (strcmp(currentEncoding, encoding) != 0) {
            currentEncoding = encoding;

            signature  = [NSMethodSignature signatureWithObjCTypes:encoding];
            invocation = [NSInvocation invocationWithMethodSignature:signature];
        }

        [invocation setTarget:_self];
        [invocation setSelector:selector];

        va_list args;
        va_start(args, _self);

        for (NSUInteger i = 2; i < signature.numberOfArguments; i++) {
            const char *argType = [signature getArgumentTypeAtIndex:i];
            id arg = va_arg(args, id);

            if (TYPE_EQUAL(argType, id)) {
                [invocation setArgument:&arg atIndex:i];
            } else {
                NSCParameterAssert([arg isKindOfClass:NSValue.class]);

                NSValue *boxedValue = arg;

                NSUInteger size = 0;
                NSGetSizeAndAlignment(boxedValue.objCType, &size, NULL);

                void *argument = malloc(size);

                [boxedValue getValue:argument];
                [invocation setArgument:argument atIndex:i];

                free(argument);
            }
        }

        va_end(args);

        [invocation invoke];

        const char *returnType = signature.methodReturnType;

        if (TYPE_EQUAL(returnType, void)) return nil;

        if (TYPE_EQUAL(returnType, id)) {
            __unsafe_unretained id returnValue;
            [invocation getReturnValue:&returnValue];
            return returnValue;
        }

        // Check if the return value can be boxed using NSNumber and return it
        // using this macro
        #define RETURN_IF_BOXABLE(index, type) \
            if (TYPE_EQUAL(returnType, type)) { \
                type returnValue; \
                [invocation getReturnValue:&returnValue]; \
                return @(returnValue); \
            } \

        metamacro_foreach(RETURN_IF_BOXABLE, , NSNUMBER_TYPES)

        #undef return_boxed

        void *returnValue = malloc(signature.methodReturnLength);
        [invocation getReturnValue:returnValue];

        NSValue *boxedReturnValue = [NSValue valueWithBytes:returnValue
                                                   objCType:signature.methodReturnType];

        free(returnValue);

        return boxedReturnValue;
    };
}
