//
//  main.m
//  HomeWork4
//
//  Created by artem.ustinov on 27.06.2021.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *student = [[Student alloc] initWithName:@"Artyom" surname:@"Ustinov" age:20];
        NSLog(@"Student %@", student);
        [student upAge];
    }
    return 0;
}
