//
//  main.c
//  位运算
//
//  Created by GongCF on 2018/10/2.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#include <stdio.h>
//isa_t 包含OC类的最基本属性
typedef struct _address{
    unsigned char a:2;          //条件1
    unsigned char b:3;          //条件2
    unsigned char c:3;          //条件3
}Address;

int main(int argc, const char * argv[]) {
    printf("结构体_address的大小为%lu字节\n",sizeof(Address));
    /*
     *初始化
     */
    Address address;
    Address *add = &address;
    add->a = 1;     //01
    add->b = 3;     //011
    add->c = 5;     //101
    
    unsigned char var = (unsigned char)169;     //10101001 = 1+0+0+8+0+32+0+128 = 169
    /*
     *与操作
     */
    //匹配add->a
    int conditionA = var&add->a;            //10101001&00000001 = 00000001 = 1
    printf("condtionA：%d\n",conditionA);
    //匹配add->b
    //先右移2位
    int varb = var>>2;          //10101001->00101010 = 42    低位丢弃，高位补0
    printf("varb：%d\n",varb);
    int conditionB = varb&add->b;       //00101010&00000011 = 00000010 = 2
    printf("conditionB：%d\n",conditionB);
    //左移3位
    char varbb = var<<3;        //10101001->01001000 = 72 低位填0，高位溢出丢掉，溢出是指超过变量类型长度
    printf("varbb：%d\n",varbb);
    //匹配add->c
    //先右移5位
    int varc = var>>5;      //10101001->00000101 = 5
    printf("varc：%d\n",varc);
    int conditionc = varc&add->c;       //00000101&00000101 = 00000101 = 5
    printf("conditionc：%d\n",conditionc);
    
    /*
     *或操作
     */
    int op3 = var|add->a;       //10101001|00000001 = 10101001 = 169
    printf("op3：%d\n",op3);
    
    /*
     *非操作
     */
    char op4 = ~var;                 //~10101001 = 01010110 = 86
    printf("op4：%d\n",(int)op4);
    
    /*
     *异或操作
     */
    int op5 = var^add->a;       //10101001^00000001 = 10101000 = 168
    printf("op5：%d\n",op5);
    return 0;
}
