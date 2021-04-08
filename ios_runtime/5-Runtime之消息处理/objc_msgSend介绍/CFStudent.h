//
//  CFStudent.h
//  5NSObject常用方法解析
//
//  Created by GongCF on 2018/9/9.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"
@protocol StudentRule
@optional
- (void)borrowBook;
@end
@interface CFStudent : CFPerson<StudentRule>
//学校
@property (nonatomic, strong) NSString *school;
//学习
- (void)studying;
//学习某本书
- (void)studyingWithBook:(NSString *)bookName;
//在某个地方学习某本书
- (void)studyingWithBook:(NSString *)bookName inPlace:(NSString *)placeName;

@end
