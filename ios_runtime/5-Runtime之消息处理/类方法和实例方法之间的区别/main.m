//
//  main.m
//  类方法和实例方法之间的区别
//
//  Created by GongCF on 2018/10/4.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"
#import <objc/runtime.h>
#import <objc/message.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         *1.实例方法和类方法的调用
         */
        CFPerson *person = [[CFPerson alloc]init];
        [person eating];        //实例方法调用
        [CFPerson sleeping];    //类方法调用
        
        ((void (*)(id,SEL))(void *)objc_msgSend)((id)person,sel_registerName("eating"));
        ((void (*)(id,SEL))(void *)objc_msgSend)(objc_getClass("CFPerson"),sel_registerName("sleeping"));
        
//        [person performSelector:@selector(sleeping)];
//        [CFPerson performSelector:@selector(eating)];
        
        /*
         *实例->类->元类
         获取isa，在isa对象的方法列表中查找指定方法
         传入实例对象，在类的方法列表中查找
         传入类对象，在元类的方法列表中查找
         */
        
        /*
         *
         class_getMethodImplementation
         从指定的类方法列表中查找指定的方法，返回此方法的地址
         */
        IMP eatIMP = class_getMethodImplementation([CFPerson class], @selector(eating));
        eatIMP();
        Class metaCls = objc_getMetaClass(class_getName([CFPerson class]));
        IMP sleepIMP = class_getMethodImplementation(metaCls, @selector(sleeping));
        sleepIMP();
        
    }
    return 0;
}
