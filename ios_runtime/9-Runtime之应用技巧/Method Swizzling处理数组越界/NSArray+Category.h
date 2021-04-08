//
//  NSArray+Category.h
//  Method Swizzling处理数组越界
//
//  Created by GongCF on 2018/11/9.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)
- (id)cf_objectAtIndex:(NSUInteger)index;
@end
