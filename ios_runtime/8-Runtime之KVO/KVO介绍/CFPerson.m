//
//  CFPerson.m
//  KVO介绍
//
//  Created by GongCF on 2018/9/13.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson.h"

@implementation CFPerson
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"属性%@变化之前的值为：%@",keyPath,change[NSKeyValueChangeOldKey]);
    NSLog(@"属性%@变化之后的值为：%@",keyPath,change[NSKeyValueChangeNewKey]);
}
@end
