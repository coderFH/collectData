//
//  main.m
//  面试题四
//
//  Created by GongCF on 2018/11/24.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFRuntimeKit.h"
#import "CFPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Class cls = [CFPerson class];
        NSLog(@"%ld",class_getInstanceSize(cls));
        NSArray *ivarList1 = [CFRuntimeKit fetchIvarList:[CFPerson class]];
        NSLog(@"ivarList1:%@",ivarList1);
        NSArray *propertyList1 = [CFRuntimeKit fetchPropertyList:[CFPerson class]];
        NSLog(@"propertyList1:%@",propertyList1);
        NSArray *methodList1 = [CFRuntimeKit fetchMethodList:[CFPerson class]];
        NSLog(@"methodList1:%@",methodList1);
        /*
         *添加属性
         */
        objc_property_attribute_t type = { "T", [[NSString stringWithFormat:@"@\"%@\"",NSStringFromClass([NSString class])] UTF8String] }; //type
        objc_property_attribute_t ownership0 = { "C", "" }; // C = copy
        objc_property_attribute_t ownership = { "N", "" }; //N = nonatomic
        objc_property_attribute_t backingivar  = { "V", "_sex" };  //variable name
        objc_property_attribute_t attrs[] = { type, ownership0, ownership, backingivar };
        class_addProperty(cls, "sex", attrs, 4);
        NSLog(@"%ld",class_getInstanceSize(cls));
        NSArray *ivarList2 = [CFRuntimeKit fetchIvarList:cls];
        NSLog(@"ivarList2:%@",ivarList2);
        NSArray *propertyList2 = [CFRuntimeKit fetchPropertyList:cls];
        NSLog(@"propertyList2:%@",propertyList2);
        NSArray *methodList2 = [CFRuntimeKit fetchMethodList:cls];
        NSLog(@"methodList2:%@",methodList2);
    }
    return 0;
}
