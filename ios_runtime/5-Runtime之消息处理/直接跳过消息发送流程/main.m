//
//  main.m
//  直接跳过消息发送流程
//
//  Created by GongCF on 2018/10/4.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFPerson *person = [[CFPerson alloc]init];
        SEL eatSel = @selector(eatingWithFood:inPlace:);
        IMP eatIMP = [person methodForSelector:eatSel];
        
        /*
         消息发送流程部分是通过汇编实现的，所以实际上差距也不大
         */
        NSDate *begin = [NSDate date];
        for (int i =0; i<100000000; i++) {
            eatIMP(person,eatSel,@"apple",@"kitchen");
        }
        NSDate *end = [NSDate date];
        NSLog(@"跳过消息发送流程，时间花费为：%.5f",[end timeIntervalSinceDate:begin]);
        
        begin = [NSDate date];
        for (int i =0; i<100000000; i++) {
            [person eatingWithFood:@"apple" inPlace:@"kitchen"];
        }
        end = [NSDate date];
        NSLog(@"正常消息发送流程，时间花费为：%.5f",[end timeIntervalSinceDate:begin]);
    }
    return 0;
}
