//
//  NSArray+Category.m
//  Method Swizzling处理数组越界
//
//  Created by GongCF on 2018/11/9.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "NSArray+Category.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>
@implementation NSArray (Category)
+ (void)load
{
//    [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(cf_objectAtIndex:)];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(cf_objectAtIndex:)];
    });
    
}

- (id)cf_objectAtIndex:(NSUInteger)index
{
    if(index > self.count-1)
    {
        NSLog(@"数组越界了！");
        return nil;
    }else
    {
        return [self cf_objectAtIndex:index];
    }
}
@end
