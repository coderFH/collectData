//
//  main.cpp
//  结构体介绍
//
//  Created by GongCF on 2018/9/30.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#include <iostream>
struct Student{
    int no;
    char name[20];
    int *age;
    Student(){
        no = 114;
        strcpy(name, "lilei");          //数组的一种赋值方式
        age = new int(20);              //分配int型空间，放入20，并将首地址给指针age
    }
};
/*
 *1.定义一个Student1结构体
 */
struct Student1:Student{
    
};

/*
 *2.定义一个结构体变量stu2
 */
struct:Student{
    
}stu2;

/*
 *3.定义一个Student3结构体和一个结构体变量stu3
 */
struct Student3:Student{
    
}stu3;

/*
 *定义一个Student4结构体，并给它取个别名
 struct Student4--->Stu4
 */
typedef struct Student4:Student{
    
}Stu4;

int main(int argc, const char * argv[]) {
    /*
     *访问结构体
     */
    //1.第一种
    struct Student1 stu1;
    printf("stu1.no：%d\n",stu1.no);
    printf("sut1.name：%c%c%c%c%c\n",*(stu1.name),*(stu1.name+1),*(stu1.name+2),*(stu1.name+3),*(stu1.name+4));
    printf("stu1.age：%d\n",*(stu1.age));
    
    //2.第二种
    printf("stu2.no：%d\n",stu2.no);
    
    //3.第三种
    struct Student3 stu33;
    printf("stu33.no：%d\n",stu33.no);
    printf("stu3.no：%d\n",stu3.no);
    
    //4.第四种
    Stu4 stu4;
    struct Student4 stu44;
    printf("stu4.no：%d\n",stu4.no);
    printf("stu44.no：%d\n",stu44.no);
    
    /*
     *结构体指针
     */
    Stu4 *pStu4 = &stu4;
    printf("pStu4->no：%d\n",pStu4->no);
    
    /*
     *结构体位域  8位=1字节  4-->00000100
     */
    struct Teacher{
        unsigned int a:1;
        unsigned int b:2;
        unsigned int c:3;
    }tc,*ptc;
    printf("%lu\n",sizeof(Teacher));        //打印结果为4字节
    ptc = &tc;
    ptc->a = 1;             //1
    ptc->b = 3;             //11
    ptc->c = 5;             //101               最大长度111=7
    printf("Teacher->a：%u\n",ptc->a);
    printf("Teacher->b：%u\n",ptc->b);
    printf("Teacher->c：%u\n",ptc->c);
    return 0;
}
