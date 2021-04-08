//
//  CFPerson.h
//  手动调用KVO
//
//  Created by GongCF on 2018/9/13.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFPerson : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *age;

- (void)setInfo:(NSDictionary *)info;
@end
