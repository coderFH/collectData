//
//  NSObject+CFCoding.m
//  自动归档和自动解档
//
//  Created by GongCF on 2018/11/11.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "NSObject+CFCoding.h"
#import <objc/runtime.h>
@implementation NSObject (CFCoding)
- (void)cf_encode:(NSCoder *)coder
{
    unsigned int outCount = 0;
    objc_property_t *properyList = class_copyPropertyList([self class], &outCount);
    for (int i=0; i<outCount; i++) {
        objc_property_t property = properyList[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        [coder encodeObject:[self valueForKey:propertyName] forKey:propertyName];
    }
}
- (void)cf_decode:(NSCoder *)decoder
{
    unsigned int outCount = 0;
    objc_property_t *properyList = class_copyPropertyList([self class], &outCount);
    for (int i=0; i<outCount; i++) {
        objc_property_t property = properyList[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id vaue = [decoder decodeObjectForKey:propertyName];
        [self setValue:vaue forKey:propertyName];
    }
}
@end
