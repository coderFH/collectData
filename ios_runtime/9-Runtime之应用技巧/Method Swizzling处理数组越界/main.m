//
//  main.m
//  Method Swizzling处理数组越界
//
//  Created by GongCF on 2018/11/8.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+Category.h"
#import <objc/runtime.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr = @[@"hello",@"world"];
        Class isa = object_getClass(arr);
        NSLog(@"[arr objectAtIndex:2]：%@",[arr objectAtIndex:2]);
        NSLog(@"第一次交换====================");
        NSLog(@"originalIMP1：%p",[arr methodForSelector:@selector(objectAtIndex:)]);
        NSLog(@"swizzledIMP1：%p",[arr methodForSelector:@selector(cf_objectAtIndex:)]);
        [NSArray load];
        NSLog(@"[arr objectAtIndex:2]：%@",[arr objectAtIndex:2]);
        NSLog(@"第二次交换====================");
        NSLog(@"originalIMP2：%p",[arr methodForSelector:@selector(objectAtIndex:)]);
        NSLog(@"swizzledIMP2：%p",[arr methodForSelector:@selector(cf_objectAtIndex:)]);
    }
    return 0;
}
