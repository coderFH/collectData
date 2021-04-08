//
//  NSObject+Category.m
//  面试题八
//
//  Created by GongCF on 2018/11/25.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>
@implementation NSObject (Category)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method m1 = class_getInstanceMethod(self, @selector(class));
        Method m2 = class_getInstanceMethod(self, @selector(myClass));
        method_exchangeImplementations(m1, m2);
    });
}
- (void)myClass
{
    [self myClass];
}
@end
