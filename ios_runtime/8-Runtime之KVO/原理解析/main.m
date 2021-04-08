//
//  main.m
//  2原理解析
//
//  Created by GongCF on 2018/9/13.
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
        NSLog(@"变化之前==================================================");
//        /*
//         *1.方法列表
//         */
//       NSArray *methodArr1 = [CFRuntimeKit fetchMethodList:object_getClass(person)];
//        NSLog(@"methodArr1：%@",methodArr1);
//
//        //2.属性列表
//        NSArray *propertyArr1 = [CFRuntimeKit fetchPropertyList:object_getClass(person)];
//        NSLog(@"propertyArr1：%@",propertyArr1);
//
//        //3.变量列表
//        NSArray *ivarArr1 = [CFRuntimeKit fetchIvarList:object_getClass(person)];
//        NSLog(@"ivarArr1：%@",ivarArr1);
//        //4.类名
//        Class className1 = [person class];
//        NSLog(@"className1：%@",className1);
//
//        //5.isa
//        Class isaName1 = object_getClass(person);
//        NSLog(@"isaName1：%@",isaName1);

        //6.Setter方法的IMP
       IMP setterIMP1 = [person methodForSelector:@selector(setName:)];
        NSLog(@"setterIMP1：%p",setterIMP1);
        
        //7.class方法的IMP
        IMP classIMP1 = [person methodForSelector:@selector(class)];
        NSLog(@"classIMP1：%p",classIMP1);
        
        [person addObserver:person forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
        
        NSLog(@"变化之后==================================================");
//        /*
//         *1.方法列表
//         */
//        NSArray *methodArr2 = [CFRuntimeKit fetchMethodList:object_getClass(person)];
//        NSLog(@"methodArr2：%@",methodArr2);
//
//        //2.属性列表
//        NSArray *propertyArr2 = [CFRuntimeKit fetchPropertyList:object_getClass(person)];
//        NSLog(@"propertyArr2：%@",propertyArr2);
//
//        //3.变量列表
//        NSArray *ivarArr2 = [CFRuntimeKit fetchIvarList:object_getClass(person)];
//        NSLog(@"ivarArr2：%@",ivarArr2);
        
//        //4.类名
//        Class className2 = [person class];
//        NSLog(@"className2：%@",className2);
//
//        //5.isa
//        Class isaName2 = object_getClass(person);
//        NSLog(@"isaName2：%@",isaName2);
        
        //6.Setter方法的IMP
        IMP setterIMP2 = [person methodForSelector:@selector(setName:)];
        NSLog(@"setterIMP2：%p",setterIMP2);
        
        //7.class方法的IMP
        IMP classIMP2 = [person methodForSelector:@selector(class)];
        NSLog(@"classIMP2：%p",classIMP2);
    
        [person removeObserver:person forKeyPath:@"name"];
        NSLog(@"还原==================================================");
//        /*
//         *1.方法列表
//         */
//        NSArray *methodArr3 = [CFRuntimeKit fetchMethodList:object_getClass(person)];
//        NSLog(@"methodArr3：%@",methodArr3);
//
//        //2.属性列表
//        NSArray *propertyArr3 = [CFRuntimeKit fetchPropertyList:object_getClass(person)];
//        NSLog(@"propertyArr3：%@",propertyArr3);
//
//        //3.变量列表
//        NSArray *ivarArr3 = [CFRuntimeKit fetchIvarList:object_getClass(person)];
//        NSLog(@"ivarArr3：%@",ivarArr3);
        
//        //4.类名
//        Class className3 = [person class];
//        NSLog(@"className3：%@",className3);
//
//        //5.isa
//        Class isaName3 = object_getClass(person);
//        NSLog(@"isaName3：%@",isaName3);
        
        //6.Setter方法的IMP
        IMP setterIMP3 = [person methodForSelector:@selector(setName:)];
        NSLog(@"setterIMP3：%p",setterIMP3);
        
        //7.class方法的IMP
        IMP classIMP3 = [person methodForSelector:@selector(class)];
        NSLog(@"classIMP3：%p",classIMP3);
    }
    return 0;
}
