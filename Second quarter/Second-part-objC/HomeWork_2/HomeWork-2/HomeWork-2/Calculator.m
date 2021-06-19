//
//  Calculator.m
//  HomeWork-2
//
//  Created by artem.ustinov on 19.06.2021.
//

#import "Calculator.h"

@implementation Calculator

-(instancetype)initWithFirstValue:(CGFloat)first AndSecond:(CGFloat)secondvalue AndThird:(CGFloat)thirdValue{
    self = [super init];
    if (self) {
        _firstValue = first;
        _secondValue = secondvalue;
        _thirdValue = thirdValue;
    }
    return self;
}

-(CGFloat)addition {
    return  self.firstValue + self.secondValue + self.thirdValue;
}

-(CGFloat)multiplication {
    return self.firstValue * self.secondValue * self.thirdValue;
}

-(CGFloat)subtraction {
    return self.firstValue - self.secondValue - self.thirdValue;
}

-(CGFloat)division {
    return self.firstValue / self.secondValue / self.thirdValue;
}

-(CGFloat)average {
    return (self.firstValue + self.secondValue + self.thirdValue) / 3;
}


@end
