//
//  main.m
//  Lesson_6
//
//  Created by artem.ustinov on 06.07.2021.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        /// Testing Block in Objective - c :D

         void (^block)(double, double, NSString*) = ^(double first, double second, NSString *operation) {
             if ([operation isEqualToString:@"+"]) {
                 NSLog(@"%f", (first + second));
             } else if ([operation isEqualToString:@"-"]) {
                 NSLog(@"%f", (first - second));
             } else if ([operation isEqualToString:@"*"]) {
                 NSLog(@"%f", (first * second));
             } else if ([operation isEqualToString:@"/"]) {
                 NSLog(@"%f", (first / second));
             } else {
                 NSLog(@"Need operations like: +, -, *, / !!!");
             }
        };
        block(12, 20, @"*");

        void (^secondBlock)(void) = ^() {
            NSLog(@"I understand with HORRIBLE SYNTAX OF closure");
        };
        secondBlock();
        
        ///Testing GCD || OPERATIONS
        dispatch_queue_t serialQueue = dispatch_queue_create("ru.example.serialQueue", NULL);
        dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
        int a = 10;
        int b = 20;
        __block int c;
        dispatch_sync(serialQueue, ^{
            c = a + b;
        });

        dispatch_async(globalQueue, ^{
            c = c + 20;
        });
        //30
        NSLog(@"%d", c);
        //50
        NSLog(@"%d", c);

        //MARK: GROUP
        __block NSInteger testA = 2;
        __block NSInteger testB = 4;
        dispatch_group_t group = dispatch_group_create();
        dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
        dispatch_queue_t queue1 = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
        dispatch_group_async(group, queue, ^{
            testA = testA + 3;
        });
        dispatch_group_async(group, queue1, ^{
            testB = testB + 4;
        });

        dispatch_group_notify(group, queue, ^{
            NSLog(@"a - %ld, b - %ld", (long)testA, (long)testB); // a - 5, b - 8
        });

        //MARK: Barrier
        dispatch_queue_t queue2 = dispatch_queue_create("ru.example.queue", NULL);
        dispatch_barrier_async(queue2, ^{
            NSLog(@"Barrier");
        });

        dispatch_async(queue2, ^{
            NSLog(@"Another task");
        });

        NSOperationQueue *currentQueue = [NSOperationQueue mainQueue];
        [currentQueue addOperationWithBlock:^{
            NSLog(@"Sucess operation!!!");
        }];

    }
    return 0;
}
