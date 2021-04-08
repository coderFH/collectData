//
//  main.m
//  4模拟KVO的实现
//
//  Created by GongCF on 2018/9/14.
//  Copyright © 2018年 GongCF. All rights reserved.
//
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

#import <Foundation/Foundation.h>
#import "CFRuntimeKit.h"
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFPerson *person = [[CFPerson alloc]init];
        NSLog(@"变化之前========================");
        //1.方法列表
        NSLog(@"methodArr：%@",[CFRuntimeKit fetchMethodList:object_getClass(person)]);
        //2.class
        NSLog(@"class：%@",[person class]);
        //3.isa
        NSLog(@"isa：%@",object_getClass(person));
        //4.setter方法的imp
        NSLog(@"setterIMP：%p",[person methodForSelector:@selector(setName:)]);
        //5.class方法的imp
        NSLog(@"classIMP：%p",[person methodForSelector:@selector(class)]);
        
        person.name = @"lilei";
        [person cf_addObserver:person forKey:@"name" options:CFKeyValueObservingOptionNew|CFKeyValueObservingOptionOld];
        person.name = @"wanger";
        
        NSLog(@"变化之后========================");
        //1.方法列表
        NSLog(@"methodArr：%@",[CFRuntimeKit fetchMethodList:object_getClass(person)]);
        //2.class
        NSLog(@"class：%@",[person class]);
        //3.isa
        NSLog(@"isa：%@",object_getClass(person));
        //4.setter方法的imp
        NSLog(@"setterIMP：%p",[person methodForSelector:@selector(setName:)]);
        //5.class方法的imp
        NSLog(@"classIMP：%p",[person methodForSelector:@selector(class)]);
        
        [person cf_removeObserver:person forKey:@"name"];
        NSLog(@"还原之后========================");
        //1.方法列表
        NSLog(@"methodArr：%@",[CFRuntimeKit fetchMethodList:object_getClass(person)]);
        //2.class
        NSLog(@"class：%@",[person class]);
        //3.isa
        NSLog(@"isa：%@",object_getClass(person));
        //4.setter方法的imp
        NSLog(@"setterIMP：%p",[person methodForSelector:@selector(setName:)]);
        //5.class方法的imp
        NSLog(@"classIMP：%p",[person methodForSelector:@selector(class)]);
    }
    return 0;
}
