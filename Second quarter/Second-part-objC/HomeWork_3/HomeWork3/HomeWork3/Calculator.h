//
//  Calculator.h
//  HomeWork3
//
//  Created by artem.ustinov on 24.06.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, Operation) {
    addition,
    multiplication,
    subtraction,
    division
};


@interface Calculator : NSObject

-(instancetype)initWithFirstValue:(CGFloat)first second:(CGFloat)secondvalue;

@property (nonatomic) CGFloat firstValue, secondValue;
@property (nonatomic) Operation action;

-(CGFloat)calculate:(Operation)withAction;

@end

NS_ASSUME_NONNULL_END
