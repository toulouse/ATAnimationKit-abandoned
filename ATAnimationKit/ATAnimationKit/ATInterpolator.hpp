//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#ifndef ATINTERPOLATOR_H_
#define ATINTERPOLATOR_H_

class FloatInterpolator {
protected:
    const float _fromValue;
    const float _toValue;
public:
    FloatInterpolator(float fromValue, float toValue) : _fromValue(fromValue), _toValue(toValue) {}
    float valueAtPercent(float percent) {
        return _fromValue + (_toValue - _fromValue) * percent;
    }
};

class DoubleInterpolator {
protected:
    const double _fromValue;
    const double _toValue;
public:
    DoubleInterpolator(double fromValue, double toValue) : _fromValue(fromValue), _toValue(toValue) {}
    double valueAtPercent(double percent) {
        return _fromValue + (_toValue - _fromValue) * percent;
    }
};

#endif /* ATINTERPOLATOR_H_ */
