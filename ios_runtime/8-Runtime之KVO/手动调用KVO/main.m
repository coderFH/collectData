//
//  main.m
//  手动调用KVO
//
//  Created by GongCF on 2018/9/13.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFPerson *person = [[CFPerson alloc]init];
        person.name = @"lilei";
        
        //添加observer
        [person addObserver:person forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        [person addObserver:person forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
//        person.name = @"zhangsan";
        
//      //手动发送通知
        [person willChangeValueForKey:@"name"];
        person.name = @"lilei";
        [person didChangeValueForKey:@"name"];
        
          //调用重写的setter方法
          person.name = @"zhangsan";
        
         //一个操作发送两个通知
        [person setInfo:@{@"name":@"wanger",@"age":@"20"}];
    }
    return 0;
}
