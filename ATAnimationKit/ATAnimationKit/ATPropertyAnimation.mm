//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#import "ATPropertyAnimation.h"
#import "ATPropertyAnimation_Internal.h"
#import "ATPropertyAnimation_Subclass.h"

#import <ATBase/ATAssert.h>
#import <ATBase/ATBaseDefines.h>
#import <ATBase/NSObject+Reflection.h>

#import "ATAnimator.h"
#import "ATAnimation_Subclass.h"
#import "ATInterpolator.hpp"
#import "ATInterpolator+CoreGraphics.hpp"

AT_INLINE NSString *_resolveContainedEncodedType(id object);
AT_INLINE IInterpolator *_newInterpolatorForEncodedType(NSString *typeString);
AT_INLINE __attribute__((overloadable)) NSNumber *wrap(float number);
AT_INLINE __attribute__((overloadable)) NSNumber *wrap(double number);
AT_INLINE __attribute__((overloadable)) NSValue *wrap(CGPoint value);
AT_INLINE __attribute__((overloadable)) NSValue *wrap(CGSize value);
AT_INLINE __attribute__((overloadable)) NSValue *wrap(CGRect value);
AT_INLINE __attribute__((overloadable)) NSValue *wrap(CGAffineTransform value);
AT_INLINE __attribute__((overloadable)) NSValue *wrap(CATransform3D value);

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

- (void)dealloc
{
    // TODO: check - is this even necessary?
    _interpolator = nullptr;
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
        _interpolator = _newInterpolatorForEncodedType(_encodedType);
    }
}

#pragma mark -

- (void)animatorDidAddAnimation:(ATAnimator *)animator
{
    [super animatorDidAddAnimation:animator];
    [self updateEncodedTypeIfNeeded];
}

#pragma mark -

- (void)setPercent:(float)percent
{
    if (_percent == percent) {
        return;
    }

    _percent = percent;

    if (!_interpolator) {
        ATFailAssert(@"Interpolator should already exist by now");
    }

    const char *type = [_encodedType UTF8String];
    if (0 == strcmp(type, @encode(float))) {
        auto interpolator = ((FloatInterpolator *)_interpolator);
        interpolator->setFromValue([_fromValue floatValue]);
        interpolator->setToValue([_toValue floatValue]);
        auto value = interpolator->valueAtPercent(percent);
        _currentValue = wrap(value);
    } else if (0 == strcmp(type, @encode(double))) {
        auto interpolator = ((DoubleInterpolator *)_interpolator);
        interpolator->setFromValue([_fromValue doubleValue]);
        interpolator->setToValue([_toValue doubleValue]);
        auto value = interpolator->valueAtPercent(percent);
        _currentValue = wrap(value);
    } else if (0 == strcmp(type, @encode(CGPoint))) {
        auto interpolator = ((CGPointInterpolator *)_interpolator);
        CGPoint fromValue, toValue;
        [_fromValue getValue:&fromValue];
        [_toValue getValue:&toValue];
        interpolator->setFromValue(fromValue);
        interpolator->setToValue(toValue);
        auto value = interpolator->valueAtPercent(percent);
        _currentValue = wrap(value);
    } else if (0 == strcmp(type, @encode(CGSize))) {
        auto interpolator = ((CGSizeInterpolator *)_interpolator);
        CGSize fromValue, toValue;
        [_fromValue getValue:&fromValue];
        [_toValue getValue:&toValue];
        interpolator->setFromValue(fromValue);
        interpolator->setToValue(toValue);
        auto value = interpolator->valueAtPercent(percent);
        _currentValue = wrap(value);
    } else if (0 == strcmp(type, @encode(CGRect))) {
        auto interpolator = ((CGRectInterpolator *)_interpolator);
        CGRect fromValue, toValue;
        [_fromValue getValue:&fromValue];
        [_toValue getValue:&toValue];
        interpolator->setFromValue(fromValue);
        interpolator->setToValue(toValue);
        auto value = interpolator->valueAtPercent(percent);
        _currentValue = wrap(value);
    } else if (0 == strcmp(type, @encode(CGAffineTransform))) {
        auto interpolator = ((CGAffineTransformInterpolator *)_interpolator);
        CGAffineTransform fromValue, toValue;
        [_fromValue getValue:&fromValue];
        [_toValue getValue:&toValue];
        interpolator->setFromValue(fromValue);
        interpolator->setToValue(toValue);
        auto value = interpolator->valueAtPercent(percent);
        _currentValue = wrap(value);
    } else if (0 == strcmp(type, @encode(CATransform3D))) {
        auto interpolator = ((CATransform3DInterpolator *)_interpolator);
        CATransform3D fromValue = [_fromValue CATransform3DValue];
        CATransform3D toValue = [_toValue CATransform3DValue];
        interpolator->setFromValue(fromValue);
        interpolator->setToValue(toValue);
        auto value = interpolator->valueAtPercent(percent);
        _currentValue = wrap(value);
    } else {
        ATFailAssert(@"Interpolation not supported");
    }

    [_object setValue:_currentValue forKeyPath:_keyPath];
}

@end

NSNumber *wrap(float number) {
    return [NSNumber numberWithFloat:number];
}

NSNumber *wrap(double number) {
    return [NSNumber numberWithDouble:number];
}

NSValue *wrap(CGPoint value) {
    return [NSValue valueWithBytes:&value objCType:@encode(CGPoint)];
}

NSValue *wrap(CGSize value) {
    return [NSValue valueWithBytes:&value objCType:@encode(CGSize)];
}

NSValue *wrap(CGRect value) {
    return [NSValue valueWithBytes:&value objCType:@encode(CGRect)];
}

NSValue *wrap(CGAffineTransform value) {
    return [NSValue valueWithBytes:&value objCType:@encode(CGAffineTransform)];
}

NSValue *wrap(CATransform3D value) {
    return [NSValue valueWithCATransform3D:value];
}

IInterpolator *_newInterpolatorForEncodedType(NSString *typeString) {
    const char *type = [typeString UTF8String];
    if (0 == strcmp(type, @encode(float))) {
        return new FloatInterpolator();
    } else if (0 == strcmp(type, @encode(double))) {
        return new DoubleInterpolator();
    } else if (0 == strcmp(type, @encode(CGPoint))) {
        return new CGPointInterpolator();
    } else if (0 == strcmp(type, @encode(CGSize))) {
        return new CGSizeInterpolator();
    } else if (0 == strcmp(type, @encode(CGRect))) {
        return new CGRectInterpolator();
    } else if (0 == strcmp(type, @encode(CGAffineTransform))) {
        return new CGAffineTransformInterpolator();
    } else if (0 == strcmp(type, @encode(CATransform3D))) {
        return new CATransform3DInterpolator();
    } else {
        ATFailAssert(@"Interpolation not supported");
        return NULL;
    }
}