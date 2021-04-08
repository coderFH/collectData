//
//  main.m
//  消息转发流程
//
//  Created by GongCF on 2018/10/4.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFStudent.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         打印runtime信息
         开启：call (void)instrumentObjcMessageSends(YES)
         关闭：call (void)instrumentObjcMessageSends(NO)
         /private/tmp/ 文件夹，找到最新的 msgSends-xxxx文件
         */
        CFStudent *student  = [CFStudent new];
        [student performSelector:@selector(eating)];
        [student performSelector:@selector(eating)];
    }
    return 0;
}
