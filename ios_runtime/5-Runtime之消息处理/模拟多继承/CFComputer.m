//
//  CFComputer.m
//  模拟多继承
//
//  Created by GongCF on 2018/10/5.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFComputer.h"
#import "CFKeyboard.h"
#import "CFScreen.h"
@interface CFComputer()
@property (nonatomic,strong)CFScreen *screen;
@property (nonatomic,strong)CFKeyboard *keyboard;
@end
@implementation CFComputer
- (instancetype)init {
    self = [super init];
    if (self) {
        self.screen = [[CFScreen alloc]init];
        self.keyboard = [[CFKeyboard alloc]init];
    }
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.screen respondsToSelector:aSelector]) {
        return self.screen;
    }else if ([self.keyboard respondsToSelector:aSelector])
    {
        return self.keyboard;
    }else
    {
        return [super forwardingTargetForSelector:aSelector];
    }
}

@end
