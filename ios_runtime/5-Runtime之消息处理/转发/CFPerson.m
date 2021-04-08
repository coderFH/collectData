//
//  CFPerson.m
//  8转发
//
//  Created by GongCF on 2018/9/11.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson.h"
#import "CFStudent.h"
@implementation CFPerson
//吃东西
- (void)eating;
{
    NSLog(@"Person eating！");
}

//生成对应的方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == NSSelectorFromString(@"playing")) {
//        return [self methodSignatureForSelector:@selector(eating)];
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    if (aSelector == NSSelectorFromString(@"studying")) {
        return [[CFStudent new] methodSignatureForSelector:@selector(studying)];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (anInvocation.selector == NSSelectorFromString(@"playing")) {
        //1.改变执行的函数
        anInvocation.selector = @selector(eating);
        [anInvocation invokeWithTarget:self];
    }
    if (anInvocation.selector == NSSelectorFromString(@"studying")) {
        //2.改变执行的目标
        [anInvocation invokeWithTarget:[CFStudent new]];
    }
    //3.同时改变执行函数和执行目标....
}

@end
