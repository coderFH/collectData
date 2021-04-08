//
//  CFPerson.m
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
#import "CFPerson.h"

@implementation CFPerson
//吃东西
- (void)eating
{
    NSLog(@"Person eating！");
}

//玩耍
- (void)playing
{
    NSLog(@"Person playing！");
}

//睡觉
+ (void)sleeping
{
    NSLog(@"Person sleeping！");
}

@end
