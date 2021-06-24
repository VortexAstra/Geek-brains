//
//  Calculator.m
//  HomeWork3
//
//  Created by artem.ustinov on 24.06.2021.
//

#import "Calculator.h"

@implementation Calculator

-(instancetype)initWithFirstValue:(CGFloat)first second:(CGFloat)secondvalue {
    self = [super init];
     if (self) {
         _firstValue = first;
         _secondValue = secondvalue;
     }
     return self;
}

-(CGFloat)calculate:(Operation)withAction {
    switch (withAction) {
        case addition:
            return _firstValue + _secondValue;
        case multiplication:
            return _firstValue * _secondValue;
        case division:
            return _firstValue / _secondValue;
        case subtraction:
            return _firstValue - _secondValue;
    }
}


@end
