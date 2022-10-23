//
//  main.m
//  HomeWork-2
//
//  Created by artem.ustinov on 19.06.2021.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

bool check(NSString const *c) {
    const int asciiCode = [c characterAtIndex:0];
    return (asciiCode >= 65 && asciiCode <= 122) ? 1 : 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (check(@"а")) {
            NSLog(@"\nThis character belongs to the English alphabet\n");
        } else {
            NSLog(@"\nThis character does not belong to the English alphabet");
        }
    }
    CGFloat firstValue, secondValue, thirdValue;
    NSLog(@"Enter first value\n");
    scanf("%lf", &firstValue);

    NSLog(@"Enter second value\n");
    scanf("%lf", &secondValue);

    NSLog(@"Enter third value\n");
    scanf("%lf", &thirdValue);

    Calculator *calculator = [[Calculator alloc] initWithFirstValue:firstValue AndSecond:secondValue AndThird:thirdValue];
    NSLog(@"Summa %lf \n", [calculator addition]);
    NSLog(@"Subtraction %lf \n", [calculator subtraction]);
    NSLog(@"Multiplication %lf \n", [calculator multiplication]);
    NSLog(@"Division %lf \n", [calculator division]); //division by zero not processed :) inf

    NSLog(@"Average %d \n", (int)[calculator average]);

    return 0;
}
