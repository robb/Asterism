#!/bin/sh


TARGET_BASE="../OneFile"

mkdir -p "$TARGET_BASE"

REV_SHA1=`git rev-parse HEAD`

FILE_BASE="$TARGET_BASE/Asterism_OneFile"
HEADER_FILE="$FILE_BASE.h"
SOURCE_FILE="$FILE_BASE.m"
GIT_REFERENCE=`git log HEAD -1 --format=reference`

## GENERATE THE HEADER FILE

cat >"$HEADER_FILE" <<HEADER
// ${HEADER_FILE##*/}
//
// Generated from:
// $GIT_REFERENCE

#import <Foundation/Foundation.h>

HEADER

tail +9 >>"$HEADER_FILE" ../Asterism/AsterismDefines.h


for f in ../Asterism/AST*.h; do
	o=${f##*/};
	cat >>"$HEADER_FILE" <<FH

#pragma mark - $o
FH
	tail +12 "$f" | sed '$!N; /^\(.*\)\n\1$/!P; D' >>"$HEADER_FILE"
done


## GENERATE THE IMPLEMENTATION FILE
cat >"$SOURCE_FILE" <<HEADER
// ${SOURCE_FILE##*/}
//
// Generated from:
// $GIT_REFERENCE

#import "${HEADER_FILE##*/}"
HEADER

for f in ../Asterism/AST*.m; do
	o=${f##*/};
	cat >>"$SOURCE_FILE" <<FH

#pragma mark - $o
FH
	tail +8 "$f" | sed '/^#import/d' | sed '$!N; /^\(.*\)\n\1$/!P; D' >>"$SOURCE_FILE"
done

