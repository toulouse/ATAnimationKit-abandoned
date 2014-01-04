//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#ifndef ATINTERPOLATOR_COREGRAPHICS_H_
#define ATINTERPOLATOR_COREGRAPHICS_H_

#include "ATInterpolator.hpp"

#include <CoreGraphics/CGGeometry.h>

class CGPointInterpolator : public Interpolator<CGPoint> {
public:
    CGPoint valueAtPercent(float percent) {
        const CGFloat x = _fromValue.x + (_toValue.x - _fromValue.x) * percent;
        const CGFloat y = _fromValue.y + (_toValue.y - _fromValue.y) * percent;
        return CGPointMake(x, y);
    }
};

class CGSizeInterpolator : public Interpolator<CGSize> {
public:
    CGSize valueAtPercent(float percent) {
        const CGFloat width = _fromValue.width + (_toValue.width - _fromValue.width) * percent;
        const CGFloat height = _fromValue.height + (_toValue.height - _fromValue.height) * percent;
        return CGSizeMake(width, height);
    }
};

class CGRectInterpolator : public Interpolator<CGRect> {
public:
    CGRect valueAtPercent(float percent) {
        const CGFloat x = _fromValue.origin.x + (_toValue.origin.x - _fromValue.origin.x) * percent;
        const CGFloat y = _fromValue.origin.y + (_toValue.origin.y - _fromValue.origin.y) * percent;
        const CGFloat width = _fromValue.size.width + (_toValue.size.width - _fromValue.size.width) * percent;
        const CGFloat height = _fromValue.size.height + (_toValue.size.height - _fromValue.size.height) * percent;
        return CGRectMake(x, y, width, height);
    }
};

class CGAffineTransformInterpolator : public Interpolator<CGAffineTransform> {
public:
    CGAffineTransform valueAtPercent(float percent) {
        return _fromValue;
    }
};

class CATransform3DInterpolator : public Interpolator<CATransform3D> {
public:
    CATransform3D valueAtPercent(float percent) {
        return _fromValue;
    }
};

#endif /* ATINTERPOLATOR_COREGRAPHICS_H_ */
