//
//  CFPerson+Category.m
//  1Catory介绍
//
//  Created by GongCF on 2018/9/15.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFStudent+Category.h"
#import <objc/runtime.h>
@implementation CFStudent (Category)
static const char ageKey;
static const char teacherKey;
static const char delegateKey;

- (void)setAge:(NSString *)age
{
    objc_setAssociatedObject(self, &ageKey, age, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)age
{
    NSString *age = objc_getAssociatedObject(self, &ageKey);
    return age;
}

+ (void)setTeacher:(NSString *)teacher
{
    objc_setAssociatedObject(self, &teacherKey, teacher, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (NSString *)teacher
{
    //注意：这里的self是CFStudent
    //而实例方法里的self是student
    NSString *teacher = objc_getAssociatedObject(self, &teacherKey);
    return teacher;
}

- (void)setDelegate:(id<ExaminationRul>)delegate
{
    objc_setAssociatedObject(self, &delegateKey, delegate, 0);
}

- (id<ExaminationRul>)delegate
{
    id<ExaminationRul> delegate = objc_getAssociatedObject(self, &delegateKey);
    return delegate;
}

//玩耍
- (void)playing
{
    NSLog(@"Student playing！");
}
//睡觉
+ (void)sleeping
{
    NSLog(@"Student sleeping！");
}
- (void)level6test{
    NSLog(@"ExaminationRul-level6test！");
}
@end
