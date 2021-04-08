//
//  CFPerson.m
//  6动态消息解析
//
//  Created by GongCF on 2018/9/11.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson.h"
#import <objc/runtime.h>
#import <objc/message.h>
NSString *_name;
@implementation CFPerson
@dynamic name;
@synthesize age;

void playIMP(id cls,SEL cmd){
    NSLog(@"Person playing!");
}

void eatIMP(id cls,SEL cmd){
    NSLog(@"Person eating!");
}

- (void)sleeping
{
    NSLog(@"Person sleeping！");
}

 + (BOOL)resolveClassMethod:(SEL)sel
{
    //动态添加类方法
    /*
     *v：返回void @：表示对象 ：表示_cmd
     */
    if (sel == NSSelectorFromString(@"playing")) {
//        class_addMethod(object_getClass([CFPerson class]), sel, (IMP)playIMP, "v@:");
        class_addMethod(objc_getMetaClass("CFPerson"), sel, (IMP)playIMP, "v@:");
        return YES;
    }
    //methodForSelector
    if(sel == @selector(sleeping)){
        class_addMethod(objc_getMetaClass("CFPerson"), sel, [[CFPerson new] methodForSelector:@selector(sleeping)], "v@:");
        return YES;
    }
    return  [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == NSSelectorFromString(@"eating")) {
        class_addMethod([CFPerson class], sel, (IMP)eatIMP, "v@:");
        return YES;
    }
    if (sel == @selector(setName:)) {
        class_addMethod(self, sel, (IMP)setName, "v@:@");
        return YES;
    }
    if (sel == @selector(name)) {
        class_addMethod(self, sel, (IMP)getName, "@@:");
        return YES;
    }
    return  [super resolveInstanceMethod:sel];
}

void setName(id cls,SEL cmd, NSString *name)
{
    _name = name;
}

id getName(id cls,SEL cmd)
{
    return _name;
}
@end
