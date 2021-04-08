//
//  main.m
//  3Catory中的方法覆盖问题
//
//  Created by GongCF on 2018/9/15.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFRuntimeKit.h"
#import "CFPerson.h"
#import "CFPerson+Category1.h"
#import "CFPerson+Category2.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFPerson *person = [[CFPerson alloc]init];
        //方法覆盖问题验证(后面编译的分类方法在最前面，优先访问它)
        [person eating];
        //查看方法列表
        NSArray *methodArr = [CFRuntimeKit fetchMethodList:[CFPerson class]];
        NSLog(@"methodArr：%@",methodArr);
        
        /*
         *调用person类的eating方法
         */
        unsigned int outCount = 0;
        Method *methodList = class_copyMethodList([CFPerson class], &outCount);
        IMP lastImp = NULL;
        SEL lastSel = NULL;
        for (unsigned int i=0; i<outCount; i++) {
            Method method = methodList[i];
            SEL methodSEL = method_getName(method);
            NSString *methodName =[NSString stringWithUTF8String:sel_getName(methodSEL)];
            if ([methodName isEqualToString:@"eating"]) {
                lastImp = method_getImplementation(method);
                lastSel = method_getName(method);
            }
        }
        ((void (*)(id,SEL))(void *)lastImp)(person,lastSel);
        free(methodList);
    }
    return 0;
}
