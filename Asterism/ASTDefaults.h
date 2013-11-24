//
//  ASTDefaults.h
//  Asterism
//
//  Created by Robert Böhnke on 16/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Fills in missing values from another dictionary.
//
// dict     - A dictionary.
// defaults - A dictionary with default values.
//
// Returns a dictionary that contains a union of key-value-pairs of dict and
// defaults. Key-value-pairs of dict will have precedence over those taken from
// defaults.
OVERLOADABLE NSDictionary *ASTDefaults(NSDictionary *dict, NSDictionary *defaults);
