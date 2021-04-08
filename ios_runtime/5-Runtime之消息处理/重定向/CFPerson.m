//
//  CFPerson.m
//  7重定向
//
//  Created by GongCF on 2018/9/11.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson.h"
#import "CFStudent.h"
@implementation CFPerson
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if (aSelector == NSSelectorFromString(@"studying")) {
        return [CFStudent new] ;
    }
    return [super forwardingTargetForSelector:aSelector];
}
@end
