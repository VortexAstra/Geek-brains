//
//  Student.h
//  HomeWork4
//
//  Created by artem.ustinov on 27.06.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

-(instancetype)initWithName:(NSString *) name surname:(NSString *) surname age:(NSInteger) age;

@property (nonatomic, strong, readwrite) NSString *name, *fullName, *surname;
@property (nonatomic, readonly) NSInteger age;

-(void)upAge;

@end

NS_ASSUME_NONNULL_END
