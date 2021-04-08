//
//  main.m
//  面试题三
//
//  Created by GongCF on 2018/11/24.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        class_addIvar([CFPerson class], "age", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
//        CFPerson *person = [[CFPerson alloc]init];
//        [person setValue:@"20" forKey:@"age"];
//        NSLog(@"%@",[person valueForKey:@"age"]);
        Class cls = objc_allocateClassPair([NSObject class], "Student", 0);
        class_addIvar(cls, "age", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
        objc_registerClassPair(cls);
        id student = [[cls alloc]init];
        [student setValue:@"20" forKey:@"age"];
        NSLog(@"%@",[student valueForKey:@"age"]);
    }
    return 0;
}
