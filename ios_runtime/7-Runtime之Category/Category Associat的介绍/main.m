//
//  main.m
//  1Catory介绍
//
//  Created by GongCF on 2018/9/15.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFStudent.h"
#import "CFStudent+Category.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFStudent *student = [[CFStudent alloc]init];
        /*
         *1.属性
         */
        student.name = @"lilei";
        NSLog(@"student.name：%@",student.name);
        student.age = @"20";
        NSLog(@"student.age：%@",student.age);
        CFStudent.teacher = @"zhangsan";
        NSLog(@"CFStudent：%@",CFStudent.teacher);
        
        /*
         *2.方法
         */
        [student eating];
        [student playing];
        [CFStudent sleeping];
        
        /*
         *3.协议
         */
        student.delegate = student;
        [student.delegate level6test];
    }
    return 0;
}
