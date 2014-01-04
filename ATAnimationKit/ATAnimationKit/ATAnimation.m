//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import "ATAnimation.h"
#import "ATAnimation_Internal.h"
#import "ATAnimation_Subclass.h"

#import <ATBase/ATAssert.h>

@implementation ATAnimation {
    CFTimeInterval _beganTime;
    CFTimeInterval _lastFrameTime;
}

+ (instancetype)animation
{
    return [[self alloc] init];
}

- (BOOL)shouldStopAtTime:(CFTimeInterval)time
{
    AT_IMPLEMENTED_BY_SUBCLASS;
    return YES;
}

- (void)_animatorDidAddAnimation:(ATAnimator *)animator
{
    _shouldStart = YES;
    
    [self animatorDidAddAnimation:animator];
}

- (void)_startWithAnimator:(ATAnimator *)animator atTime:(CFTimeInterval)time
{
    if (_running) {
        ATFailAssert(@"Shouldn't be starting a started animation");
    }
    
    _beganTime = time;
    
    _shouldStart = NO;
    _running = YES;
    
    [self startWithAnimator:animator atTime:time];
    
    if ([_delegate respondsToSelector:@selector(animationDidStart:)]) {
        [_delegate animationDidStart:self];
    }
}

- (void)_applyWithAnimator:(ATAnimator *)animator atTime:(CFTimeInterval)time
{
    ATAssert(_running, @"Shouldn't be ticking while not running");
    if (_running) {
        _lastFrameTime = time;
        
        [self applyAnimationAtTime:time];
    }
}

- (void)_stopWithAnimator:(ATAnimator *)animator finished:(BOOL)finished
{
    if (!_running) {
        ATFailAssert(@"Shouldn't be stopping a stopped animation");
    }
    
    _running = NO;
    
    if ([_delegate respondsToSelector:@selector(animationDidStop:finished:)]) {
        [_delegate animationDidStop:self finished:finished];
    }
}

- (void)animatorDidAddAnimation:(ATAnimator *)animator
{
}

- (void)startWithAnimator:(ATAnimator *)animator atTime:(CFTimeInterval)time
{
}

- (void)applyAnimationAtTime:(CFTimeInterval)time
{
}

- (void)stopWithAnimator:(ATAnimator *)animator finished:(BOOL)finished
{
}

@end
