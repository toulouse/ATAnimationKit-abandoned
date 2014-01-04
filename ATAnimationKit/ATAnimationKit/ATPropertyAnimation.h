//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import <ATAnimationKit/ATAnimation.h>

@interface ATPropertyAnimation : ATAnimation

// TODO: explain why this is retained
@property (nonatomic, strong) id object;
@property (nonatomic, copy) NSString *keyPath;

@property (nonatomic, copy) id fromValue;
@property (nonatomic, copy) id toValue;
@property (nonatomic, copy, readonly) id currentValue;

+ (instancetype)animationWithKeyPath:(NSString *)keyPath object:(id)object;

@end
