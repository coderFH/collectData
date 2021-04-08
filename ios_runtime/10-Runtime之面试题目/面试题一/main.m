//
//  main.m
//  面试题一
//
//  Created by GongCF on 2018/11/24.
//  Copyright © 2018年 GongCF. All rights reserved.
//
/*
 *总结
 OC 2.0
 alloc+init=new
 参数 zone已经被忽略掉
 最终都是调用class_careateInstance
 */
#import <Foundation/Foundation.h>
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFPerson *person1 = [[CFPerson alloc]init];
        NSLog(@"%p",person1);
        CFPerson *person2 = [CFPerson new];
        NSLog(@"%p",person2);
    }
    return 0;
}
