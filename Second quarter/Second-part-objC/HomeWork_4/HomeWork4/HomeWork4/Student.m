//
//  Student.m
//  HomeWork4
//
//  Created by artem.ustinov on 27.06.2021.
//

#import "Student.h"

@implementation Student

-(instancetype)initWithName:(NSString *) name surname:(NSString *) surname age:(NSInteger) age;
{
    self = [super init];
    if (self) {
        _name = name;
        _surname = surname;
        _age = age;
    }
    return self;
}
- (NSString *)name {
    return _name;
}

- (NSString *)fullName {
    return [[self.name stringByAppendingString:@" "] stringByAppendingString:self.surname];
}

-(NSString *)description {
    return [NSString stringWithFormat:@" - %@, age - %ld", self.fullName, (long)_age];
}

-(void)upAge {
    _age += 1;
}
@end
