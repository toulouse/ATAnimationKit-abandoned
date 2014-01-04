//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#ifndef ATDELTAFUNCTIONS_H_
#define ATDELTAFUNCTIONS_H_

#import <ATBase/ATBaseDefines.h>

#import <CoreGraphics/CGGeometry.h>

AT_INLINE __attribute__((overloadable)) float delta(float a, float b) {
    return b - a;
}

AT_INLINE __attribute__((overloadable)) double delta(double a, double b) {
    return b - a;
}

AT_INLINE __attribute__((overloadable)) CGPoint delta(CGPoint a, CGPoint b) {
    return CGPointMake(b.x - a.x, b.y - a.y);
}

AT_INLINE __attribute__((overloadable)) CGSize delta(CGSize a, CGSize b) {
    return CGSizeMake(b.width - a.width, b.height - a.height);
}

AT_INLINE __attribute__((overloadable)) CGRect delta(CGRect a, CGRect b) {
    return (CGRect){delta(b.origin, a.origin), delta(b.size, a.size)};
}

#endif /* ATDELTAFUNCTIONS_H_ */