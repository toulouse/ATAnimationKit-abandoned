//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

@interface ATAnimator : NSObject

+ (instancetype)sharedAnimator;
- (void)start;
- (void)stop;

@end
