//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import "ATPropertyAnimation.h"
#import "ATPropertyAnimation_Internal.h"
#import "ATPropertyAnimation_Subclass.h"

#import <ATBase/ATAssert.h>
#import <ATBase/ATBaseDefines.h>
#import <ATBase/NSObject+Reflection.h>
#import <ATBase/NSValue+Helpers.h>

#import "ATAnimation_Subclass.h"
#import "ATInterpolators.h"


@implementation ATPropertyAnimation

+ (instancetype)animationWithKeyPath:(NSString *)keyPath object:(id)object {
    ATPropertyAnimation *animation = [self animation];
    animation.object = object;
    animation.keyPath = keyPath;

    return animation;
}

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

#pragma mark -

- (void)setKeyPath:(NSString *)keyPath
{
    if (_keyPath != keyPath) {
        _keyPath = [keyPath copy];
        [self setNeedsEncodedTypeUpdate];
    }
}

- (void)setObject:(id)object
{
    if (_object != object) {
        _object = object;
        [self setNeedsEncodedTypeUpdate];
    }
}

- (void)setNeedsEncodedTypeUpdate
{
    _needsEncodedTypeUpdate = YES;
}

- (void)updateEncodedTypeIfNeeded
{
    if (_needsEncodedTypeUpdate) {
        _encodedType = [_object encodedTypeForKeyPath:_keyPath];
    }
}

#pragma mark - Subclass methods

- (void)animatorDidAddAnimation:(ATAnimator *)animator
{
    [super animatorDidAddAnimation:animator];
    [self updateEncodedTypeIfNeeded];
}

- (void)startAnimationAtTime:(CFTimeInterval)time
{
    [super startAnimationAtTime:time];
    if (!_fromValue) {
        _fromValue = [_object valueForKeyPath:_keyPath];
    }
}

#pragma mark -

- (void)setPercent:(float)percent
{
    if (_percent == percent) {
        return;
    }

    _percent = percent;

    const char *type = [_encodedType UTF8String];
    if (0 == strcmp(type, @encode(float))) {
        float value = AT_INTERPOLATE([_fromValue floatValue], [_toValue floatValue], percent);
        _currentValue = [NSNumber numberWithFloat:value];
    } else if (0 == strcmp(type, @encode(double))) {
        double value = AT_INTERPOLATE([_fromValue doubleValue], [_toValue doubleValue], percent);
        _currentValue = [NSNumber numberWithDouble:value];
    } else if (0 == strcmp(type, @encode(CGPoint))) {
        CGPoint value = AT_INTERPOLATE([_fromValue CGPointValue], [_toValue CGPointValue], percent);
        _currentValue = [NSValue valueWithCGPoint:value];
    } else if (0 == strcmp(type, @encode(CGSize))) {
        CGSize value = AT_INTERPOLATE([_fromValue CGSizeValue], [_toValue CGSizeValue], percent);
        _currentValue = [NSValue valueWithCGSize:value];
    } else if (0 == strcmp(type, @encode(CGRect))) {
        CGRect value = AT_INTERPOLATE([_fromValue CGRectValue], [_toValue CGRectValue], percent);
        _currentValue = [NSValue valueWithCGRect:value];
    } else if (0 == strcmp(type, @encode(CGAffineTransform))) {
        CGAffineTransform value = AT_INTERPOLATE([_fromValue CGAffineTransformValue], [_toValue CGAffineTransformValue], percent);
        _currentValue = [NSValue valueWithCGAffineTransform:value];
    } else if (0 == strcmp(type, @encode(CATransform3D))) {
        CATransform3D value = AT_INTERPOLATE([_fromValue CATransform3DValue], [_toValue CATransform3DValue], percent);
        _currentValue = [NSValue valueWithCATransform3D:value];
    } else {
        ATFailAssert(@"Interpolation not supported");
    }

    [_object setValue:_currentValue forKeyPath:_keyPath];
}

@end