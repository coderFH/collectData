//
//  PersonController.m
//  万能跳转界面方法
//
//  Created by GongCF on 2018/11/11.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "PersonController.h"
@interface PersonController()
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@end
@implementation PersonController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lbl.text=[NSString stringWithFormat:@"name=%@",self.name];
}
@end
