//  Copyright (c) 2013 Andrew Toulouse. All rights reserved.

#ifndef ATINTERPOLATOR_H_
#define ATINTERPOLATOR_H_

class IInterpolator {
public:
    template<typename T>
    T valueAtPercent(float percent);

    template<typename T>
    void setFromValue(T fromValue);

    template<typename T>
    void setToValue(T toValue);
};

template <typename T>
class Interpolator : public IInterpolator {
protected:
    T _fromValue;
    T _toValue;
public:
    T valueAtPercent(float percent);

    void setFromValue(T fromValue) {
        _fromValue = fromValue;
    }

    void setToValue(T toValue) {
        _toValue = toValue;
    }
};

class FloatInterpolator : public Interpolator<float> {
public:
    float valueAtPercent(float percent) {
        return _fromValue + (_toValue - _fromValue) * percent;
    }
};

class DoubleInterpolator : public Interpolator<double> {
public:
    double valueAtPercent(float percent) {
        return _fromValue + (_toValue - _fromValue) * percent;
    }
};

#endif /* ATINTERPOLATOR_H_ */
