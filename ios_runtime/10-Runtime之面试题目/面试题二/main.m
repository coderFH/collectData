//
//  main.m
//  面试题二
//
//  Created by GongCF on 2018/11/24.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         *1.消息流程
         */
//        CFPerson *person = [[CFPerson alloc]init];
//        [person playing];
//        [CFPerson eating];
        
        /*
         *2.直接从指定类的方法列表中获取IMP
         */
        IMP imp1 = class_getMethodImplementation([CFPerson class],@selector(playing));
        NSLog(@"imp1:%p",imp1);
        IMP imp2 = class_getMethodImplementation(objc_getMetaClass("CFPerson"),@selector(playing));
        NSLog(@"imp2:%p",imp2);
        IMP imp3 = class_getMethodImplementation([CFPerson class],@selector(eating));
        NSLog(@"imp3:%p",imp3);
        IMP imp4 = class_getMethodImplementation(objc_getMetaClass("CFPerson"),@selector(eating));
        NSLog(@"imp4:%p",imp4);
        /*
         *可以看到imp2、imp3都是指向的_objc_msgForward地址
         */
        NSLog(@"\n");
        
        /*
         *3.直接从指定类的方法列表中获取Method，再获取IMP
         */
        Method instanceM1 = class_getInstanceMethod([CFPerson class], @selector(playing));
        IMP IMP1 = method_getImplementation(instanceM1);
        NSLog(@"IMP1:%p",IMP1);
        Method instanceM2 = class_getInstanceMethod(objc_getMetaClass("CFPerson"), @selector(playing));
        IMP IMP2 = method_getImplementation(instanceM2);
        NSLog(@"IMP2:%p",IMP2);
        Method instanceM3 = class_getInstanceMethod([CFPerson class], @selector(eating));
        IMP IMP3 = method_getImplementation(instanceM3);
        NSLog(@"IMP3:%p",IMP3);
        Method instanceM4 = class_getInstanceMethod(objc_getMetaClass("CFPerson"), @selector(eating));
        IMP IMP4 = method_getImplementation(instanceM4);
        NSLog(@"IMP4:%p",IMP4);
        /*
         *可以看到IMP2、IMP3都是指向的0x0地址，表示没有找到对应的IMP
         */
        NSLog(@"\n");
        /*
         *4.直接从指定类的元类方法列表中获取Method，再获取IMP
         */
        Method classM1 = class_getClassMethod([CFPerson class], @selector(playing));
        IMP IMP5 = method_getImplementation(classM1);
        NSLog(@"IMP5:%p",IMP5);
        Method classM2 = class_getClassMethod(objc_getMetaClass("CFPerson"), @selector(playing));
        IMP IMP6 = method_getImplementation(classM2);
        NSLog(@"IMP6:%p",IMP6);
        Method classM3 = class_getClassMethod([CFPerson class], @selector(eating));
        IMP IMP7 = method_getImplementation(classM3);
        NSLog(@"IMP7:%p",IMP7);
        Method classM4 = class_getClassMethod(objc_getMetaClass("CFPerson"), @selector(eating));
        IMP IMP8 = method_getImplementation(classM4);
        NSLog(@"IMP8:%p",IMP8);
        /*
         *可以看到IMP5、IMP6都是指向的0x0地址，表示没有找到对应的方法
         思考：为啥IMP7、IMP8都是同一个IMP呢？
         因为：class_getClassMethod中会判断当前传入的cls是否为元类，isMetaClass，若为元类，直接返回当前cls，否则返回cls->isa
         */
    }
    return 0;
}
