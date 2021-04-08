//
//  CFPerson.m
//  4函数initialize
//
//  Created by GongCF on 2018/9/15.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson.h"

@implementation CFPerson
+ (void)initialize{
    NSLog(@"Person-initialize!");
}

+ (void)load
{
    NSLog(@"Person-load!");
}
@end
