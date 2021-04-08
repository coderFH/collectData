//
//  CFPerson.m
//  2原理解析
//
//  Created by GongCF on 2018/9/13.
//  Copyright © 2018年 GongCF. All rights reserved.
//
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif
#import "CFPerson.h"
@implementation CFPerson
- (void)cf_observeValueForKey:(NSString *)key ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change
{
    NSLog(@"属性%@改变之前的值为：%@",key,change[NSKeyValueChangeOldKey]);
    NSLog(@"属性%@改变之后的值为：%@",key,change[NSKeyValueChangeNewKey]);
}
@end
