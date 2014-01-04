//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#ifndef ATDELTAFUNCTIONS_H_
#define ATDELTAFUNCTIONS_H_

#include <CoreGraphics/CGAffineTransform.h>
#include <CoreGraphics/CGGeometry.h>

#include <QuartzCore/CATransform3D.h>

#define AT_DELTA(a, b) _Generic((a), \
float: delta_float, \
double: delta_double, \
CGPoint: delta_CGPoint, \
CGSize: delta_CGSize, \
CGRect: delta_CGRect, \
CGAffineTransform: delta_CGAffineTransform, \
CATransform3D: delta_CATransform3D \
)(a, b)

float delta_float(float a, float b);
double delta_double(double a, double b);
CGPoint delta_CGPoint(CGPoint a, CGPoint b);
CGSize delta_CGSize(CGSize a, CGSize b);
CGRect delta_CGRect(CGRect a, CGRect b);
CGAffineTransform delta_CGAffineTransform(CGAffineTransform a, CGAffineTransform b);
CATransform3D delta_CATransform3D(CATransform3D a, CATransform3D b);

#endif /* ATDELTAFUNCTIONS_H_ */