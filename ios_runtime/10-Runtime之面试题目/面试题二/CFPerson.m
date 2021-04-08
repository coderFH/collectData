//
//  CFPerson.m
//  面试题二
//
//  Created by GongCF on 2018/11/24.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson.h"
#import <objc/runtime.h>
@implementation CFPerson
- (void)playing
{
    NSLog(@"Person playing!");
    NSLog(@"%p",object_getClass(self));
}
+ (void)eating
{
    NSLog(@"Person eating!");
    NSLog(@"%p",self);
}
@end
