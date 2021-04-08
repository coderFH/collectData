//
//  CFStudent.m
//  5NSObject常用方法解析
//
//  Created by GongCF on 2018/9/9.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFStudent.h"

@implementation CFStudent
//学习
- (void)studying
{
    NSLog(@"Student studying！");
}
//学习某本书
- (void)studyingWithBook:(NSString *)bookName
{
    NSLog(@"Student studyingWithBook：%@!",bookName);
}
//在某个地方学习某本书
- (void)studyingWithBook:(NSString *)bookName inPlace:(NSString *)placeName
{
    NSLog(@"Student studyingWithBook：%@! inPlace：%@",bookName,placeName);
}
- (void)borrowBook
{
    NSLog(@"borrowBook!");
}
@end
