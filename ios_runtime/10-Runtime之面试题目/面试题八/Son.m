//
//  Son.m
//  面试题七
//
//  Created by GongCF on 2018/11/25.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "Son.h"
@implementation Son
- (instancetype)init
{
    self = [super init];
    if (self) {
        /*
         *1.沿着继承链找到的方法，执行时，self还是son吗？
         */
//        NSLog(@"%@",NSStringFromClass([self class]));
        /*
         *2.执行[super class]方法时，消息接受者到底是谁，是son，还是father？
         */
        NSLog(@"%@",NSStringFromClass([super class]));
        //
    }
    return self;
}
@end
