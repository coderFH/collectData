//
//  main.m
//  面试题五
//
//  Created by GongCF on 2018/11/24.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        (( void (*)(id,SEL))_objc_msgForward)([CFPerson new],@selector(playing));
    }
    return 0;
}
