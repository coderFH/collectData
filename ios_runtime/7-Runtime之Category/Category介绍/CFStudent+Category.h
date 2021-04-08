//
//  CFPerson+Category.h
//  1Catory介绍
//
//  Created by GongCF on 2018/9/15.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFStudent.h"
@protocol ExaminationRul
@optional
- (void)level6test;
@end

/*
 *分类（实例属性、类属性、实例方法、类方法、协议）
 */
@interface CFStudent (Category)<ExaminationRul>
//注意：这些属性都使用不了，因为分类不能生成变量（内存已分配好），所以也没有setter、getter方法
@property(nonatomic,copy)NSString *age;
@property(class,nonatomic,copy)NSString *teacher;   //类属性使多个实例可以共享变量
@property(nonatomic,weak)id <ExaminationRul> delegate;

//玩耍
- (void)playing;
//睡觉
+ (void)sleeping;
@end
