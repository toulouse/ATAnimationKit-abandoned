//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#include "ATDeltaFunctions.h"

float delta_float(float a, float b) {
    return b - a;
}

double delta_double(double a, double b) {
    return b - a;
}

CGPoint delta_CGPoint(CGPoint a, CGPoint b) {
    return CGPointMake(b.x - a.x, b.y - a.y);
}

CGSize delta_CGSize(CGSize a, CGSize b) {
    return CGSizeMake(b.width - a.width, b.height - a.height);
}

CGRect delta_CGRect(CGRect a, CGRect b) {
    return (CGRect){delta_CGPoint(b.origin, a.origin), delta_CGSize(b.size, a.size)};
}

CGAffineTransform delta_CGAffineTransform(CGAffineTransform a, CGAffineTransform b) {
    return CGAffineTransformIdentity;
}

CATransform3D delta_CATransform3D(CATransform3D a, CATransform3D b) {
    return CATransform3DIdentity;
}
