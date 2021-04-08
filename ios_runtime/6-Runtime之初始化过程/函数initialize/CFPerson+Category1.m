//
//  CFPerson+Category1.m
//  4函数initialize
//
//  Created by GongCF on 2018/9/15.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson+Category1.h"

@implementation CFPerson (Category1)
+ (void)initialize{
    NSLog(@"Category1-initialize!");
}

+ (void)load
{
    NSLog(@"Category1-load!");
}
@end
