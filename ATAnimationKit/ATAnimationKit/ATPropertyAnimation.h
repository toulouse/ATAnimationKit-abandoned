//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import <ATAnimationKit/ATAnimation.h>

@interface ATPropertyAnimation : ATAnimation

@property (nonatomic, strong) id object;
@property (nonatomic, copy) NSString *keyPath;

+ (instancetype)animationWithKeyPath:(NSString *)keyPath;

@end
