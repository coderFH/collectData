//
//  main.m
//  5NSObject常用方法解析
//
//  Created by GongCF on 2018/9/9.
//  Copyright © 2018年 GongCF. All rights reserved.
//
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif
#import <Foundation/Foundation.h>
#import "CFStudent.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFPerson *person = [[CFPerson alloc]init];
        CFStudent *student1 = [[CFStudent alloc]init];
        CFStudent *student2 = [[CFStudent alloc]init];
        CFStudent *student3 = student2;
        /*
         *1.isEqual   判断两个对象的存储空间是否一致
         */
        NSLog(@"[student2 isEqual:student3]:%d",[student2 isEqual:student3]);
        NSLog(@"[student1 isEqual:student2]:%d",[student1 isEqual:student2]);
        NSLog(@"\n");
        /*
         *2.performSelector系列
         */
        [student1 performSelector:@selector(studying)];
        [student1 performSelector:@selector(studyingWithBook:) withObject:@"English"];
        [student1 performSelector:@selector(studyingWithBook:inPlace:) withObject:@"English" withObject:@"library"];
        NSLog(@"\n");
        /*
         *3.isMemberOfClass   某个对象是否属于指定类
         */
        NSLog(@"[student1 isMemberOfClass:[CFStudent class]]:%d",[student1 isMemberOfClass:[CFStudent class]]);
        NSLog(@"[student1 isMemberOfClass:[CFPerson class]]:%d",[student1 isMemberOfClass:[CFPerson class]]);
        NSLog(@"\n");
        /*
         *4.isKindOfClass     某个对象是否属于指定类或其父类
         */
        NSLog(@"[student1 isKindOfClass:[CFStudent class]]:%d",[student1 isKindOfClass:[CFStudent class]]);
        NSLog(@"[student1 isKindOfClass:[CFPerson class]]:%d",[student1 isKindOfClass:[CFPerson class]]);
        NSLog(@"\n");
        /*
         *5.isSubclassOfClass     某个对象是否属于指定类的子类
         */
        NSLog(@"[CFStudent class] isSubclassOfClass:[NSObject class]]:%d",[CFStudent isSubclassOfClass:[NSObject class]]);
        NSLog(@"\n");
        /*
         *6.conformsToProtocol 是否遵从某个协议
         */
        NSLog(@"[student2 conformsToProtocol:@protocol(StudentRule)]:%d",[student2 conformsToProtocol:@protocol(StudentRule)]);
        NSLog(@"[[CFStudent class] conformsToProtocol:@protocol(StudentRule)]:%d",[CFStudent conformsToProtocol:@protocol(StudentRule)]);
        NSLog(@"[CFPerson conformsToProtocol:@protocol(StudentRule)]:%d",[CFPerson conformsToProtocol:@protocol(StudentRule)]);
        NSLog(@"\n");
        /*
         *7.respondsToSelector  是否响应某个方法
         实例对象的方法存放在类对象方法列表中
         类对象的方法存放在元类对象方法列表中
         */
        NSLog(@"[CFPerson respondsToSelector:@selector(playing)]:%d",[CFPerson respondsToSelector:@selector(playing)]);
        NSLog(@"[student1 respondsToSelector:@selector(eating)]:%d",[student1 respondsToSelector:@selector(eating)]);
        NSLog(@"[CFStudent instancesRespondToSelector:@selector(sleeping)]:%d",[CFStudent instancesRespondToSelector:@selector(sleeping)]);
        NSLog(@"\n");
        /*
         *8.methodForSelector、instanceMethodForSelector
         *methodForSelector 对象是实例，则返回实例方法，对象是类，则返回类方法
         *instanceMethodForSelector只返回实例方法
         */
        
        //实例方法
        SEL playSel = @selector(playing);
        IMP playImp = [CFPerson instanceMethodForSelector:playSel];
        void (*playFunc)(id, SEL) = (void *)playImp;
        playFunc(person, playSel);
        
        SEL eatSel = @selector(eating);
        IMP eatImp = [student1 methodForSelector:eatSel];
        void (*eatFunc)(id, SEL) = (void *)eatImp;
        eatFunc(student1, eatSel);
        
        //类方法
        SEL sleepSel = @selector(sleeping);
        IMP sleepImp = [CFPerson methodForSelector:sleepSel];
        void (*sleepFunc)(id, SEL) = (void *)sleepImp;
        sleepFunc([CFStudent class], sleepSel);


    }
    return 0;
}
