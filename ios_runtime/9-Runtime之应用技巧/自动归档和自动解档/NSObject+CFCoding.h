//
//  NSObject+CFCoding.h
//  自动归档和自动解档
//
//  Created by GongCF on 2018/11/11.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CFCoding)
- (void)cf_encode:(NSCoder *)coder;
- (void)cf_decode:(NSCoder *)decoder;
@end
