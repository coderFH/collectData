//
//  CFPerson.m
//  1Catory介绍
//
//  Created by GongCF on 2018/9/15.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFStudent.h"
#import "CFStudent+Extension.h"
/*
 *扩展（私有：变量、属性）
 */
@interface CFStudent()
{
    NSInteger _num;     //学号
}
@property(nonatomic,assign)BOOL sex;
@end
@implementation CFStudent
//吃东西
- (void)eating
{
    _num = 123456;
    self.sex = YES;
    _class = @(2018);
    NSLog(@"_num:%ld   self.sex:%d   _class:%@",(long)_num,self.sex,_class);
    NSLog(@"Person eating！");
}


@end
