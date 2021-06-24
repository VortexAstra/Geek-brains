//
//  main.m
//  HomeWork3
//
//  Created by artem.ustinov on 24.06.2021.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

typedef NS_ENUM(NSUInteger, Gender) {
    male,
    female,
};

struct Human {
    NSString *name;
    NSInteger age;
    Gender gender;
} human;

void print1(void);
void print2(void);
void print3(void);
void firstTask(int);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        firstTask(3);
        human.age = 2;
        human.gender = male;
        human.name = @"123";
        Calculator *calculator = [[Calculator alloc] initWithFirstValue:120 second:20];
        NSLog(@"%f", [calculator calculate:multiplication]);
    }
    return 0;
}

void firstTask(int choiceOption) {
    switch (choiceOption) {
        case 1:
            print1();
            break;
        case 2:
            print2();
            break;
        case 3:
            print3();
            break;
        default:
            break;
    }
}

void print1() {
    char input[100] = {};
    NSLog(@"Enter your line");
    scanf("%s", input);
    NSString *inputString = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
    for (NSInteger i = 0; i < inputString.length; i++) {
        NSLog(@"%C", [inputString characterAtIndex:i]);
    }
}

void print2() {
    int i = 0;
    char input[100] = {};
    NSLog(@"Enter your line");
    scanf("%s", input);
    NSString *inputString = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
    do {
        NSLog(@"%C", [inputString characterAtIndex:i]);
        i++;
    } while (i != [inputString length]);
}

void print3() {
    int i = 0;
    char input[100] = {};
    NSLog(@"Enter your line");
    scanf("%s", input);
    NSString *inputString = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];

    while (i != [inputString length]) {
        NSLog(@"%C", [inputString characterAtIndex:i]);
        i++;
    }
}
