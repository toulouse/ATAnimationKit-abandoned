//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#ifndef ATINTERPOLATOR_COREGRAPHICS_H_
#define ATINTERPOLATOR_COREGRAPHICS_H_

#include "ATInterpolator.hpp"

#include <CoreGraphics/CGGeometry.h>

class CGFloatInterpolator {
protected:
    const CGFloat _fromValue;
    const CGFloat _toValue;
public:
    CGFloatInterpolator(CGFloat fromValue, CGFloat toValue) : _fromValue(fromValue), _toValue(toValue) {}
    CGFloat valueAtPercent(float percent) {
        return _fromValue + (_toValue - _fromValue) * percent;
    }
};

class CGPointInterpolator {
protected:
    const CGPoint _fromValue;
    const CGPoint _toValue;
public:
    CGPointInterpolator(CGPoint fromValue, CGPoint toValue) : _fromValue(fromValue), _toValue(toValue) {}
    CGPoint valueAtPercent(float percent) {
        const CGFloat x = _fromValue.x + (_toValue.x - _fromValue.x) * percent;
        const CGFloat y = _fromValue.y + (_toValue.y - _fromValue.y) * percent;
        return CGPointMake(x, y);
    }
};

class CGSizeInterpolator {
protected:
    const CGSize _fromValue;
    const CGSize _toValue;
public:
    CGSizeInterpolator(CGSize fromValue, CGSize toValue) : _fromValue(fromValue), _toValue(toValue) {}
    CGSize valueAtPercent(float percent) {
        const CGFloat width = _fromValue.width + (_toValue.width - _fromValue.width) * percent;
        const CGFloat height = _fromValue.height + (_toValue.height - _fromValue.height) * percent;
        return CGSizeMake(width, height);
    }
};

class CGRectInterpolator {
protected:
    const CGRect _fromValue;
    const CGRect _toValue;
public:
    CGRectInterpolator(CGRect fromValue, CGRect toValue) : _fromValue(fromValue), _toValue(toValue) {}
    CGRect valueAtPercent(float percent) {
        const CGFloat x = _fromValue.origin.x + (_toValue.origin.x - _fromValue.origin.x) * percent;
        const CGFloat y = _fromValue.origin.y + (_toValue.origin.y - _fromValue.origin.y) * percent;
        const CGFloat width = _fromValue.size.width + (_toValue.size.width - _fromValue.size.width) * percent;
        const CGFloat height = _fromValue.size.height + (_toValue.size.height - _fromValue.size.height) * percent;
        return CGRectMake(x, y, width, height);
    }

};

#endif /* ATINTERPOLATOR_COREGRAPHICS_H_ */
