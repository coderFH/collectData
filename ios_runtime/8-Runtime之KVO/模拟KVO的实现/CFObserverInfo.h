//
//  CFObserverInfo.h
//  模拟KVO的实现
//
//  Created by GongCF on 2018/10/26.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSUInteger, CFKeyValueObservingOptions)
{
    CFKeyValueObservingOptionNew = 0x01,        //01
    CFKeyValueObservingOptionOld = 0x02          //10
};
@interface CFObserverInfo : NSObject
//监听者
@property(nonatomic,strong)id observer;
//被监听的key
@property(nonatomic,copy)NSString *key;
//监听策略
@property(nonatomic,assign)CFKeyValueObservingOptions options;

- (instancetype)initWithObserver:(id)observer withKey:(NSString *)key withOptions:(CFKeyValueObservingOptions)options;
@end
