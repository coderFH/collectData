//
//  main.m
//  面试题九
//
//  Created by GongCF on 2018/11/25.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sark.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
        BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
        BOOL res3 = [(id)[Sark class] isKindOfClass:[Sark class]];
        BOOL res4 = [(id)[Sark class] isMemberOfClass:[Sark class]];
        NSLog(@"\n res1:%hhd\n res2:%hhd\n res3:%hhd\n res4:%hhd\n",res1,res2,res3,res4);
    }
    return 0;
}
