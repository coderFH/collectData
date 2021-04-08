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
        student.name = @"lilei";
        NSLog(@"student.name：%@",student.name);
        
        //调用方法
        [student eating];
        [student playing];
        [CFStudent sleeping];
    }
    return 0;
}
