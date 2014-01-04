//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#include "ATInterpolators.h"

float interpolate_float(float fromValue, float toValue, float percent) {
    return fromValue + (toValue - fromValue) * percent;
}

double interpolate_double(double fromValue, double toValue, float percent) {
    return fromValue + (toValue - fromValue) * percent;
}

CGPoint interpolate_CGPoint(CGPoint fromValue, CGPoint toValue, float percent) {
    const CGFloat x = fromValue.x + (toValue.x - fromValue.x) * percent;
    const CGFloat y = fromValue.y + (toValue.y - fromValue.y) * percent;
    return CGPointMake(x, y);
}

CGSize interpolate_CGSize(CGSize fromValue, CGSize toValue, float percent) {
    const CGFloat width = fromValue.width + (toValue.width - fromValue.width) * percent;
    const CGFloat height = fromValue.height + (toValue.height - fromValue.height) * percent;
    return CGSizeMake(width, height);
}

CGRect interpolate_CGRect(CGRect fromValue, CGRect toValue, float percent) {
    const CGFloat x = fromValue.origin.x + (toValue.origin.x - fromValue.origin.x) * percent;
    const CGFloat y = fromValue.origin.y + (toValue.origin.y - fromValue.origin.y) * percent;
    const CGFloat width = fromValue.size.width + (toValue.size.width - fromValue.size.width) * percent;
    const CGFloat height = fromValue.size.height + (toValue.size.height - fromValue.size.height) * percent;
    return CGRectMake(x, y, width, height);
}

CGAffineTransform interpolate_CGAffineTransform(CGAffineTransform fromValue, CGAffineTransform toValue, float percent) {
        return toValue;
}

CATransform3D interpolate_CATransform3D(CATransform3D fromValue, CATransform3D toValue, float percent) {
        return toValue;
}