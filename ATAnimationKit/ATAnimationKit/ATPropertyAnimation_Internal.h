//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import "ATPropertyAnimation.h"


@interface ATPropertyAnimation () {
    BOOL _needsEncodedTypeUpdate;
}

@property (nonatomic, copy, readonly) NSString *encodedType;

- (void)setNeedsEncodedTypeUpdate;
- (void)updateEncodedTypeIfNeeded;

@end
