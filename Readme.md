# Asterism ⁂

Asterism is yet another functional toolbelt for Objective-C. It tries to be
typesafe and elegant.

```objective-c
NSDictionary *reviewsByRating = ASTGroup(reviews, ASTLift0(rating));

// Log all five star ratings
ASTEach(reviewsByRating[@5], ^(XYReview *review) {
    NSLog(@"%@", review);
});

XYReview *worstReview = ASTMin(reviews);
```

I'd like Asterism to eventually offer common methods for data structures for all
of Cocoa's collections.

## Lifting

A notable feature of Asterism is that it allows you to lift selectors into
blocks. Together with [partial block evaluation](Asterism/ASTPartial.h), this
allows you to write very concise code.

```objective-c
NSArray *files = @[ file1, file2, file3 ];

// Invoke -upload on all files
ASTEach(files, ASTLift0(upload));
```

```objective-c
XYUser *user = [XYUser me];

NSArray *posts = @[ post1, post2, post3 ];

// Invoke -[XYUser likePost:] on user with every post
ASTEach(posts, ASTPartial(ASTLift(likePost:), user));
```

## Supported Operations

Asterism currently supports the following operations:

* [defaults](Asterism/ASTDefaults.h)
* [difference](Asterism/ASTDifference.h)
* [each](Asterism/ASTEach.h)
* [empty](Asterism/ASTEmpty.h)
* [extend](Asterism/ASTExtend.h)
* [filter](Asterism/ASTFilter.h)
* [find](Asterism/ASTFind.h)
* [group](Asterism/ASTGroup.h)
* [head](Asterism/ASTHead.h)
* [intersection](Asterism/ASTIntersection.h)
* [lift](Asterism/ASTLift.h)
* [map](Asterism/ASTMap.h)
* [min & max](Asterism/ASTMinMax.h)
* [negate](Asterism/ASTNegate.h)
* [partial](Asterism/ASTPartial.h)
* [pluck](Asterism/ASTPluck.h)
* [reduce](Asterism/ASTReduce.h)
* [reject](Asterism/ASTReject.h)
* [tail](Asterism/ASTTail.h)
* [union](Asterism/ASTUnion.h)
