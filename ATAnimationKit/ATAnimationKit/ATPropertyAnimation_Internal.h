//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import "ATPropertyAnimation.h"

@interface ATPropertyAnimation () {
    NSString *_encodedType;
    BOOL _needsEncodedTypeUpdate;
}

- (void)setNeedsEncodedTypeUpdate;
- (void)updateEncodedTypeIfNeeded;

@end
