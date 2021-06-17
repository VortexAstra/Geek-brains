//
//  main.m
//  HomeWork-1
//
//  Created by artem.ustinov on 17.06.2021.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"


int main(int argc, const char * argv[]) {
    CGFloat firstValue, secondValue, thirdValue;
    printf("Enter first value\n");
    scanf("%lf", &firstValue);

    printf("Enter second value\n");
    scanf("%lf", &secondValue);

    printf("Enter third value\n");
    scanf("%lf", &thirdValue);

    Calculator *calculator = [[Calculator alloc] initWithFirstValue:firstValue AndSecond:secondValue AndThird:thirdValue];
    printf("Summa %lf \n", [calculator addition]);
    printf("Subtraction %lf \n", [calculator subtraction]);
    printf("Multiplication %lf \n", [calculator multiplication]);
    printf("Division %lf \n", [calculator division]); //division by zero not processed :) inf

    printf("Average %d \n", (int)[calculator average]);
    return 0;
}


