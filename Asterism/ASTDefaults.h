//
//  ASTDefaults.h
//  Asterism
//
//  Created by Robert Böhnke on 16/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTDefaults) NSDictionary *__ASTDefaults_NSDictionary(NSDictionary *dict, NSDictionary *defaults);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Fills in missing values from another dictionary.
///
/// @param dict     A dictionary.
/// @param defaults A dictionary of default values.
///
/// @returns A new dictionary that contains a union of key-value-pairs of
///          @c dict and @c defaults. Key-value-pairs of @c dict will have
///          precedence over those taken from @c defaults.
ASTERISM_OVERLOADABLE NSDictionary *ASTDefaults(NSDictionary *dict, NSDictionary *defaults) {
    return __ASTDefaults_NSDictionary(dict, defaults);
}

#pragma clang diagnostic pop
