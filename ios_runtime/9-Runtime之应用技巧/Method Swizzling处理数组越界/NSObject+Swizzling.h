//
//  NSObject+Swizzling.h
//  Method Swizzling处理数组越界
//
//  Created by GongCF on 2018/11/8.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)
+ (void)swizzleMethod:(SEL)originalSel withMethod:(SEL)swizzledSel;
@end
