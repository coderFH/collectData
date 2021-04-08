//
//  CFPerson.m
//  手动调用KVO
//
//  Created by GongCF on 2018/9/13.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson.h"

@implementation CFPerson

- (void)setName:(NSString *)name
{
    if(_name!=name){
        [self willChangeValueForKey:@"name"];
        _name = name;
        [self didChangeValueForKey:@"name"];
    }
}

- (void)setInfo:(NSDictionary *)info {
    [self willChangeValueForKey:@"age"];
    [self willChangeValueForKey:@"name"];
    _name = info[@"name"];
    _age = info[@"age"];
    [self didChangeValueForKey:@"name"];
    [self didChangeValueForKey:@"age"];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if([key isEqualToString:@"name"]||[key isEqualToString:@"age"]) {
        return NO;
    } else {
        return [super automaticallyNotifiesObserversForKey:key];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"属性%@改变之前的值为：%@",keyPath,change[NSKeyValueChangeOldKey]);
    NSLog(@"属性%@改变之后的值为：%@",keyPath,change[NSKeyValueChangeNewKey]);
}
@end
