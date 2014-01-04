//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import "ATPropertyAnimation.h"
#import "ATPropertyAnimation_Internal.h"

@implementation ATPropertyAnimation

+ (instancetype)animationWithKeyPath:(NSString *)keyPath {
    ATPropertyAnimation *animation = [self animation];
    animation.keyPath = keyPath;
    return animation;
}

@end
