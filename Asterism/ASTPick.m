//
//  ASTPick.m
//  Asterism
//
//  Created by Robert Böhnke on 31/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTFilter.h"

#import "ASTPick.h"

OVERLOADABLE NSDictionary *ASTPick(NSDictionary *dict, NSArray *keys) {
    return ASTFilter(dict, ^BOOL(id key, id obj) {
        return [keys containsObject:key];
    });
}
