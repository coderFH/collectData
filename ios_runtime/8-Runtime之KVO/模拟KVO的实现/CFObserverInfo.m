//
//  CFObserverInfo.m
//  模拟KVO的实现
//
//  Created by GongCF on 2018/10/26.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFObserverInfo.h"

@implementation CFObserverInfo
- (instancetype)initWithObserver:(id)observer withKey:(NSString *)key withOptions:(CFKeyValueObservingOptions)options
{
    self = [super init];
    if (self) {
        self.observer = observer;
        self.key = key;
        self.options = options;
    }
    return self;
}
@end
