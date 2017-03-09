//
//  Model.m
//  TestModelOC
//
//  Created by Zzcz on 2017/2/10.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "Model.h"

@implementation Model

/*
 oc数据模型
 赋值方法常用的两种，
 一 
   在.h文件的接口中声明属性（.m中接口声明的属性类外部不可以访问），使用时对属性逐一赋值
 二
   在.h文件的接口中声明属性（.m中接口声明的属性类外部不可以访问），使用构造函数赋值，需要注意，构造函数声明需写在.h的接口中，这样类外部可以调用该函数
   构造函数有两种，类函数和类函数，它们区别在于调用时，类函数使用类名直接调用，函数需要构造类对象，才能调用
 在构造函数中，使用setValuesForKeysWithDictionary赋值
 
 */
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)model:(NSDictionary *)dict {
   /*
    Model *m = [[super alloc]init];
    if (m) {
    [m setValuesForKeysWithDictionary:dict];
    }
    return m;
    */
    return [[super alloc]initWithDict:dict];
}


@end
