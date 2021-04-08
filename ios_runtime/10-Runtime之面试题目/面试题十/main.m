//
//  main.m
//  面试题十
//
//  Created by GongCF on 2018/11/25.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Sark.h"
#import "CFRuntimeKit.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [NSObject foo];
        [[NSObject new] performSelector:@selector(foo)];
       
        /*
         *看看NSObject的实例方法列表，和类方法列表。
         */
        NSArray *instanceMethods = [CFRuntimeKit fetchMethodList:[NSObject class]];
        NSArray *classMethods = [CFRuntimeKit fetchMethodList:object_getClass([NSObject class])];
        //由于方法比较多，遍历查询
        for (NSDictionary *dic in instanceMethods) {
            NSString * methodName = dic[@"methodName"];
            if ([methodName containsString:@"foo"]) {
                NSLog(@"instanceMethods含有foo方法：%@",dic);
                break;
            }
        }
        for (NSDictionary *dic in classMethods) {
            NSString * methodName = dic[@"methodName"];
            if ([methodName containsString:@"foo"]) {
                NSLog(@"classMethods含有foo方法：%@",dic);
                break;
            }
        }
    }
    return 0;
}
