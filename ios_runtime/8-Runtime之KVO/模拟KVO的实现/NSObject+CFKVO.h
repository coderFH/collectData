//
//  NSObject+CFKVO.h
//  模拟KVO的实现
//
//  Created by GongCF on 2018/10/26.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFObserverInfo.h"
@interface NSObject (CFKVO)
//添加KVO
- (void)cf_addObserver:(NSObject *)observer forKey:(NSString *)key options:(CFKeyValueObservingOptions)options;
//监听KVO
-(void)cf_observeValueForKey:(NSString *)key ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change;
//删除KVO
- (void)cf_removeObserver:(NSObject *)observer forKey:(NSString *)key;
@end
