//
//  NSObject+CFKVO.m
//  模拟KVO的实现
//
//  Created by GongCF on 2018/10/26.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "NSObject+CFKVO.h"
#import <objc/message.h>
#import <objc/runtime.h>
static const char KVO_observerArr;

static NSString *CFKVONotifying_=@"CFKVONotifying_";

@implementation NSObject (CFKVO)
/*
 *关键工作
 1.注册类，继承self
 2.修改isa
 3.重写setter方法
 4.重写class方法
 5.通知外界
 */
//也可以写成block形式
- (void)cf_addObserver:(NSObject *)observer forKey:(NSString *)key options:(CFKeyValueObservingOptions)options
{
    /*
     *1.获取setter方法名
     */
    NSString *setterName = [NSString stringWithFormat:@"set%@:",[key capitalizedString]];// setName
    SEL setterSEL = NSSelectorFromString(setterName);
    /*
     *2.获取对应setter方法
     */
   Method setterMethod = class_getInstanceMethod([self class], setterSEL);
    if (!setterMethod) {
        NSLog(@"指定key不存在，或者没有setter方法！");
        return;
    }
    /*
     *3.判断是否已经替换过isa
     */
    Class isaClass = object_getClass(self);
    NSString *isaName = NSStringFromClass(isaClass);
    if (![isaName hasPrefix:CFKVONotifying_]) { // CFKVONotifying_CFPerson  如果没有替换过isa
        /*
         *4.注册新类
         */
        NSString *oldClassName = NSStringFromClass([self class]);
        NSString *isaClassName = [CFKVONotifying_ stringByAppendingString:oldClassName];
        isaClass = NSClassFromString(isaClassName);
        if (!isaClass) {
            //创建新类
            isaClass = objc_allocateClassPair([self class], [isaClassName UTF8String], 0);
            //注册新类
            objc_registerClassPair(isaClass);
        }
        /*
         *5.修改原类的isa
         */
        object_setClass(self, isaClass);
    }
    /*
     *6.添加setter方法
     此时[self class]=CFKVONotifying_xxx,或者用isaClass
     */
    class_addMethod([self class], setterSEL, (IMP)KVO_setter, method_getTypeEncoding(setterMethod));
    /*
     *7.添加class方法
     */
    SEL classSEL = @selector(class);
    Method classMethod = class_getInstanceMethod([self class], classSEL);
    class_addMethod([self class], classSEL, (IMP)KVO_class, method_getTypeEncoding(classMethod));
    /*
     *8.处理观察者
     */
    CFObserverInfo *info = [[CFObserverInfo alloc]initWithObserver:observer withKey:key withOptions:options];
    NSMutableArray *observerArr = objc_getAssociatedObject(self, &KVO_observerArr);
    if (!observerArr) {
        observerArr = [NSMutableArray array];
    }
    [observerArr addObject:info];
    objc_setAssociatedObject(self, &KVO_observerArr, observerArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

void KVO_setter(id self, SEL _cmd, id newValue) {
    /*
     *(1)获取key setName:--->name
     */
    NSString *setterStr = NSStringFromSelector(_cmd);
    //key的首字母小写：n
    NSString *str1 = [[setterStr substringWithRange:NSMakeRange(3, 1)] lowercaseString];
    //key的剩余字母：ame
    NSString *str2 = [setterStr substringWithRange:NSMakeRange(4, [setterStr rangeOfString:@":"].location-4)];
    NSString *key = [NSString stringWithFormat:@"%@%@",str1,str2];
    
    /*
     *(2)获取以前的value值
     */
    id oldValue = [self valueForKey:key];
    
    /*
     *(3)调用父类的setter方法
     */
    struct objc_super superClass;
    superClass.receiver = self;
    superClass.super_class = class_getSuperclass(object_getClass(self));
    ((void (*)(void *,SEL,id))(void *)objc_msgSendSuper)(&superClass,_cmd,newValue);
    
    /*
     *(4)通知外界
     */
    NSMutableArray *observers = objc_getAssociatedObject(self, &KVO_observerArr);
    for (CFObserverInfo *info in observers) {
        if ([info.key isEqualToString:key]) {
           /*
            *(5)封装回传消息
            CFKeyValueObservingOptionNew|CFKeyValueObservingOptionOld = 11
            info.options&CFKeyValueObservingOptionNew =11&01 = 01
            info.options&CFKeyValueObservingOptionOld =11&10 = 10
            */ dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSMutableDictionary<NSKeyValueChangeKey,id> *change =[NSMutableDictionary dictionaryWithCapacity:2];
                if (info.options&CFKeyValueObservingOptionNew) {
                    [change setObject:newValue forKey:NSKeyValueChangeNewKey];
                }
                if (info.options&CFKeyValueObservingOptionOld) {
                    [change setObject:oldValue forKey:NSKeyValueChangeOldKey];
                }
                ((void (*)(id,SEL,id,id,id))(void *)objc_msgSend)(info.observer,@selector(cf_observeValueForKey:ofObject:change:),info.key,self,change);
            });
        }
    }
    
}

Class KVO_class(id self, SEL _cmd)
{
    //获取isa、在获取isa的父类
    return class_getSuperclass(object_getClass(self));
}

-(void)cf_observeValueForKey:(NSString *)key ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change
{
    
}

- (void)cf_removeObserver:(NSObject *)observer forKey:(NSString *)key;
{
    NSMutableArray *observers = objc_getAssociatedObject(self, &KVO_observerArr);
    if (!observers||observers.count<=0) {
        return;
    }
    for (CFObserverInfo *info in observers) {
        if ([info.key isEqualToString:key]) {
            [observers removeObject:info];
            objc_setAssociatedObject(self, &KVO_observerArr, observers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            break;
        }
    }
    /*
     *当observers为空时，重新设置isa
     */
    if(observers.count<=0)
    {
        object_setClass(self, [self class]);
    }
}

@end
