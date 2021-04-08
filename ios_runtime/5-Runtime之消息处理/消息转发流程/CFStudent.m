//
//  CFStudent.m
//  消息转发流程
//
//  Created by GongCF on 2018/10/4.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFStudent.h"
#import "CFPerson.h"
@implementation CFStudent
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(eating)) {
        return [CFPerson new];
    }
    return [super forwardingTargetForSelector:aSelector];
}
@end
