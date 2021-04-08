//
//  main.m
//  4函数initialize
//
//  Created by GongCF on 2018/9/15.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFStudent.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         *load加载顺序和编译顺序有关，可以在compile source中调整
         */
        /*
         *类在查找方法时，会先判断有没有initialize
         */
        [CFPerson class];
        [CFStudent class];
    }
    return 0;
}
