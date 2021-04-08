//
//  main.m
//  2OC中的类结构
//
//  Created by GongCF on 2018/9/9.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFPerson *person = [CFPerson new];
        [person test];
    }
    return 0;
}
