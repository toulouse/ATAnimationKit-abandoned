//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#ifndef ATINTERPOLATOR_H_
#define ATINTERPOLATOR_H_

#include <CoreGraphics/CGAffineTransform.h>
#include <CoreGraphics/CGGeometry.h>

#include <QuartzCore/CATransform3D.h>

#import <ATBase/ATBaseDefines.h>

#define AT_INTERPOLATE(fromValue, toValue, percent) _Generic((fromValue), \
    float: interpolate_float, \
    double: interpolate_double, \
    CGPoint: interpolate_CGPoint, \
    CGSize: interpolate_CGSize, \
    CGRect: interpolate_CGRect, \
    CGAffineTransform: interpolate_CGAffineTransform, \
    CATransform3D: interpolate_CATransform3D \
)(fromValue, toValue, percent)

float interpolate_float(float fromValue, float toValue, float percent);
double interpolate_double(double fromValue, double toValue, float percent);
CGPoint interpolate_CGPoint(CGPoint fromValue, CGPoint CGPoint, float percent);
CGSize interpolate_CGSize(CGSize fromValue, CGSize toValue, float percent);
CGRect interpolate_CGRect(CGRect fromValue, CGRect toValue, float percent);
CGAffineTransform interpolate_CGAffineTransform(CGAffineTransform fromValue, CGAffineTransform toValue, float percent);
CATransform3D interpolate_CATransform3D(CATransform3D fromValue, CATransform3D toValue, float percent);

#endif /* ATINTERPOLATOR_H_ */
