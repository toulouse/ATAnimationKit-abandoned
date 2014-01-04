//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import "ATAnimator.h"

#import <ATBase/ATLog.h>

#import "ATAnimation.h"
#import "ATDisplayLink.h"

@implementation ATAnimator {
    ATDisplayLink *_displayLink;
    NSMapTable *_animations;
}

+ (instancetype)sharedAnimator
{
    static dispatch_once_t onceToken;
    static ATAnimator *animator;
    dispatch_once(&onceToken, ^{
        animator = [[ATAnimator alloc] init];
    });
    return animator;
}

- (instancetype)init
{
    if (self = [super init]) {
        _displayLink = [ATDisplayLink displayLinkWithTarget:self selector:@selector(displayLinkDidNotify:)];

        _animations = [NSMapTable strongToStrongObjectsMapTable];
    }
    return self;
}

- (void)displayLinkDidNotify:(ATDisplayLink *)displayLink
{
}

- (void)start
{
    _displayLink.paused = NO;
}

- (void)stop
{
    _displayLink.paused = YES;
}

- (void)addAnimation:(ATAnimation *)anim forKey:(NSString *)key
{
    if ([_animations objectForKey:key]) {
        ATLogWarn(@"Warning! Animation with key %@ already existed!", key);
        [_animations removeObjectForKey:key];
    }
    [_animations setObject:anim forKey:key];
}

- (ATAnimation *)animationForKey:(NSString *)key
{
    return [_animations objectForKey:key];
}

- (void)removeAnimationForKey:(NSString *)key
{

}

@end
