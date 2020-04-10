//
//  ASTExtend.h
//  Asterism
//
//  Created by Robert Böhnke on 24/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTExtend) NSDictionary *__ASTExtend_NSDictionary(NSDictionary *dict, NSDictionary *source);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Extends a dictionary with values from another dictionary.
///
/// @param dict   A dictionary.
/// @param source A dictionary of extensions.
///
/// @returns A new dictionary that contains a union of key-value-pairs of
///          @c dict and @c source. Key-value-pairs of @c source will have
///          precedence over those taken from @c dict.
ASTERISM_OVERLOADABLE NSDictionary *ASTExtend(NSDictionary *dict, NSDictionary *source) {
    return __ASTExtend_NSDictionary(dict, source);
}

#pragma clang diagnostic pop
