//
//  StudentController.m
//  万能跳转界面方法
//
//  Created by GongCF on 2018/11/11.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "StudentController.h"
@interface StudentController()
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@end
@implementation StudentController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lbl.text=[NSString stringWithFormat:@"age=%@,sex=%@",self.age,self.sex];
}
@end
