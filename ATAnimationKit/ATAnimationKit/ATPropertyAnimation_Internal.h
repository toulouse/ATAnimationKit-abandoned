//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import "ATPropertyAnimation.h"
#import "ATInterpolator.hpp"

@interface ATPropertyAnimation () {
    NSString *_encodedType;
    BOOL _needsEncodedTypeUpdate;

    IInterpolator *_interpolator;
}

- (void)setNeedsEncodedTypeUpdate;
- (void)updateEncodedTypeIfNeeded;

@end
