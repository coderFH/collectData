//
//  main.m
//  Runtime介绍
//
//  Created by GongCF on 2018/10/3.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
@interface Person:NSObject
@property (nonatomic,assign)int age;
@end
@implementation Person
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
//        person.age = 20;
//        Person *person = ((Person *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("Person"), sel_registerName("new"));        //@Selector()
//        ((void (*)(id, SEL, int))(void *)objc_msgSend)((id)person, sel_registerName("setAge:"), 20);
        //id：被执行的对象  SEL：被执行的方法  int：参数
//        ((void (*)(id, SEL, int))(void *)objc_msgSend)((id)person, @selector(setAge:), 20);
        objc_msgSend((id)person, @selector(setAge:), 20);
        NSLog(@"年龄是：%d",person.age);
    }
    return 0;
}
