//
//  ViewController.m
//  Tagged Pointer介绍
//
//  Created by GongCF on 2018/10/3.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "ViewController.h"
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Tagged Pointer指针
    NSNumber *number1 = @7;
    NSNumber *number2 = @11;
    NSNumber *number3 = @555;       //2x16x16+2x16+11 = 555
    
    //对象大小
    NSLog(@"NSNumber Size：%ld",sizeof([NSNumber class]));
    
    NSLog(@"number1：%p",number1);
    NSLog(@"number2：%p",number2);
    NSLog(@"number3：%p",number3);
    
    //普通的指针
    NSNumber *number4 = @(0xefffffffffffffff);
    NSLog(@"number4：%p",number4);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
