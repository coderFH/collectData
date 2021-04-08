//
//  main.m
//  1KVO介绍
//
//  Created by GongCF on 2018/9/13.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         *KVO
         context可以用于做标志符
         */
        CFPerson *person = [[CFPerson alloc]init];
//        person.name = @"lilei";
        [person addObserver:person forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
//        person.name = @"wanger";
        
        person.father = [CFFather new];
//        person.father.name = @"zhangsan";
        [person addObserver:person forKeyPath:@"father.name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
//        person.father.name = @"lisi";
        
        //一般在dealloc释放观察对象
//        [person removeObserver:person forKeyPath:@"name"];
//        [person removeObserver:person forKeyPath:@"father.name"];
        
        /*
         *KVC，执行KVC语句时，会优先判断是否有对应的Setter、Getter方法，优先调用
         */
        [person setValue:@"lilei" forKey:@"name"];
        NSLog(@"person.name：%@",[person valueForKey:@"name"]);
        [person setValue:@"zhangsan" forKeyPath:@"father.name"];
        NSLog(@"person.father.name：%@",[person valueForKeyPath:@"father.name"]);
    }
    return 0;
}
