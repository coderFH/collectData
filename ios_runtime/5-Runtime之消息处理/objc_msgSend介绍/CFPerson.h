//
//  CFPerson.h
//  5NSObject常用方法解析
//
//  Created by GongCF on 2018/9/9.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFPerson : NSObject
//姓名
@property(nonatomic,copy)NSString *name;
//吃东西
- (void)eatingWithFood:(NSString*)foodName inPlace:(NSString*)placeName;
//玩耍
- (void)playing;
//睡觉
+ (void)sleeping;

@end
