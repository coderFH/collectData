//
//  main.m
//  动态消息解析
//
//  Created by GongCF on 2018/10/5.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //1.类方法
//        [CFPerson performSelector:NSSelectorFromString(@"playing")];
//        [CFPerson performSelector:NSSelectorFromString(@"sleeping")];
        //2.实例方法
        CFPerson *person = [[CFPerson alloc]init];
        [person performSelector:NSSelectorFromString(@"eating")];
//        [person performSelector:NSSelectorFromString(@"sleeping")];     //可以执行成功
        
        /*
         *3.@dynamic
         */
        person.name = @"lilei";
        NSLog(@"person.name：%@",person.name);
        
        person.age = @"20";
        NSLog(@"person.age：%@",person.age);
    }
    return 0;
}
