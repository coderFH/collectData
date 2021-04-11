//
//  NSObject+Swizzling.m
//  Method Swizzling处理数组越界
//
//  Created by GongCF on 2018/11/8.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>
@implementation NSObject (Swizzling)
+ (void)swizzleMethod:(SEL)originalSel withMethod:(SEL)swizzledSel
{
    /*
     *1.获取originalSel、swizzledSel的method
     */
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    if (!originalMethod) {
        NSLog(@"original method:%@ not found!",NSStringFromSelector(originalSel));
        return;
    }
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSel);
    if (!swizzledMethod) {
        NSLog(@"swizzled method:%@ not found!",NSStringFromSelector(swizzledSel));
        return;
    }
    /*
     *2.为了避免影响到父类的方法，添加方法
     class_getInstanceMethod如果自己类找不到该方法,会去父类进行查找
     所以这一步进行一个添加方法的操作,避免交换了父类的方法,引起其他继承该父类的类出现问题,
     其实就是只交换我自己的,不去交换父类的,所以需要先添加一下
     */
    class_addMethod(self, originalSel, class_getMethodImplementation(self, originalSel), method_getTypeEncoding(originalMethod));
    class_addMethod(self, swizzledSel, class_getMethodImplementation(self, swizzledSel), method_getTypeEncoding(swizzledMethod));

    /*
     *3.交换方法实现
     */
    method_exchangeImplementations(class_getInstanceMethod(self,originalSel), class_getInstanceMethod(self, swizzledSel));
}
@end
