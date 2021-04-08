//
//  CFPerson.m
//  2OC中的类结构
//
//  Created by GongCF on 2018/9/9.
//  Copyright © 2018年 GongCF. All rights reserved.
//
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

#import "CFPerson.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation CFPerson
- (void)test
{
    //实例对象
    NSLog(@"Person实例地址:%@",self);
    //类对象
    Class myClass = objc_getClass("CFPerson");
    NSLog(@"Person类地址:%p",myClass);
    //元类对象
    Class metaClass = objc_getMetaClass("CFPerson");
    NSLog(@"Person元类地址:%p",metaClass);
    //父类对象
    Class superCls = class_getSuperclass(myClass);
    NSLog(@"Person父类地址:<%@:%p>",superCls,superCls);

    //NSObject实例对象
    NSObject *obj = [NSObject new];
    NSLog(@"NSObject实例地址:%@",obj);
    //类对象
    Class objClass = objc_getClass("NSObject");
    NSLog(@"NSObject类地址:%p",objClass);
    //元类对象
    Class objMetaClass = objc_getMetaClass("NSObject");
    NSLog(@"NSObject元类地址:%p",objMetaClass);
    //父类对象
    Class objSuperCls = class_getSuperclass(objClass);
    NSLog(@"NSObject父类地址:<%@:%p>",objSuperCls,objSuperCls);
    
    
    //元类，它也是一个对象，所以也有属于的类
    /*
     *objc_getClass参数是类名的字符串，返回的就是这个类的类对象；object_getClass参数是id类型，它返回的是这个id的isa指针所指向的Class，如果传参是Class，则返回该Class的metaClass。
     *objc_getClass:对象名作为key值，Class作为value，objc_getClass实质就是从一个类哈希表中根据key获取value
     */
    NSLog(@"---------------------------");
    NSLog(@"Person实例的isa:%p",object_getClass(self));
    NSLog(@"Person类的isa:%p",object_getClass(myClass));
    NSLog(@"Person元类的isa:%p",object_getClass(metaClass));
    
    NSLog(@"NSObject实例的isa:%p",object_getClass(obj));
    NSLog(@"NSObject类的isa:%p",object_getClass(objClass));
    NSLog(@"NSObject元类的isa:%p",object_getClass(objMetaClass));
    
    //查看isa
    for(int i=0;i<5;i++){
        myClass = object_getClass(myClass);
        NSLog(@"第%d次获得的isa：%p",i,myClass);
    }
}
@end
