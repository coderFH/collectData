//
//  main.m
//  8转发
//
//  Created by GongCF on 2018/9/11.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFPerson *person = [[CFPerson alloc]init];
        //把执行playing方法，变成执行person里的eating
        [person performSelector:NSSelectorFromString(@"playing")];
        //把执行studying方法，交给student类
        [person performSelector:NSSelectorFromString(@"studying")];
    }
    return 0;
}
