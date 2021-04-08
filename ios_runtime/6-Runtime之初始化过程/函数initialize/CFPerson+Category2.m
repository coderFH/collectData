//
//  CFPerson+Category2.m
//  4函数initialize
//
//  Created by GongCF on 2018/9/15.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson+Category2.h"

@implementation CFPerson (Category2)
+ (void)initialize{
    NSLog(@"Category2-initialize!");
}

+ (void)load
{
    NSLog(@"Category2-load!");
}
@end
