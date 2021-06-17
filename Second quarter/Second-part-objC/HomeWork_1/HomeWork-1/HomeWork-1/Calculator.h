//
//  Calculator.h
//  HomeWork-1
//
//  Created by artem.ustinov on 17.06.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject

@property (nonatomic) CGFloat firstValue, secondValue, thirdValue;

-(instancetype)initWithFirstValue:(CGFloat)first AndSecond:(CGFloat)secondvalue AndThird:(CGFloat)thirdValue;

-(CGFloat)addition;
-(CGFloat)subtraction;
-(CGFloat)multiplication;
-(CGFloat)division;
-(CGFloat)average;

@end

NS_ASSUME_NONNULL_END
