//
//  main.m
//  objc_msgSend介绍
//
//  Created by GongCF on 2018/10/4.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFStudent.h"
#import <objc/runtime.h>
#import <objc/message.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         *1.正常调用方法
         */
        CFPerson *person  =  [CFPerson new];
        CFStudent *student  = [CFStudent new];
        [person eatingWithFood:@"apple" inPlace:@"kitchen"];
        [person playing];
        [CFPerson sleeping];
        
        /*
         *2.使用objc_msgSend
         */
        SEL eatSel = @selector(eatingWithFood:inPlace:);
        SEL playSel = @selector(playing);
        SEL sleepSel = NSSelectorFromString(@"sleeping");
        objc_msgSend(person,playSel);
        objc_msgSend(person,eatSel,@"apple",@"kitchen");
        objc_msgSend([CFPerson class],sleepSel);
        
        // objc_msgSend_stret：消息返回的是结构体
        objc_msgSend_fpret(<#id  _Nullable self#>, <#SEL  _Nonnull op, ...#>)
        //objc_msgSend_fpret：消息返回的是浮点数
        objc_msgSend_stret(<#id  _Nullable self#>, <#SEL  _Nonnull op, ...#>)
        //objc_msgSendSuper：给父类发消息
        objc_msgSendSuper(<#struct objc_super * _Nonnull super#>, <#SEL  _Nonnull op, ...#>)
        
        struct objc_super objSuper;
        objSuper.receiver = student;
        objSuper.super_class = [CFPerson class];
        objc_msgSendSuper(&objSuper,playSel);
    }
    return 0;
}
