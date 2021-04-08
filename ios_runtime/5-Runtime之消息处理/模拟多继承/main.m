//
//  main.m
//  9 模拟多继承
//
//  Created by GongCF on 2018/9/11.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFComputer.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFComputer *computer = [[CFComputer alloc]init];
        [computer input];
        [computer show];
    }
    return 0;
}
