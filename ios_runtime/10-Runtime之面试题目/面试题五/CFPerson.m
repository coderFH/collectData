//
//  CFPerson.m
//  面试题五
//
//  Created by GongCF on 2018/11/24.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson.h"
#import "CFStudent.h"
#import <objc/runtime.h>
@implementation CFPerson
- (void)playing
{
    NSLog(@"Person playing 1!");
}
/*
 *动态消息解析
 */
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == NSSelectorFromString(@"playing")) {
        class_addMethod([CFPerson class], sel, (IMP)playIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void playIMP(id cls,SEL cmd)
{
    NSLog(@"Person playing 2!");
}

///*
// *重定向
// */
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    if (aSelector == NSSelectorFromString(@"playing")) {
//        return [CFStudent new];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

/*
 *转发
 */
//生成对应的方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == NSSelectorFromString(@"playing")) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if (anInvocation.selector == NSSelectorFromString(@"playing")) {
        [anInvocation invokeWithTarget:[CFStudent new]];
    }
}
@end
