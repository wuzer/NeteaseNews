//
//  NSObject+JFExtension.m
//  网易新闻
//
//  Created by Jefferson on 15/10/23.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "NSObject+JFExtension.h"
#import <objc/runtime.h>

@implementation NSObject (JFExtension)

// 字典转模型
+ (instancetype)objectWithDict:(NSDictionary *)dict {
    
    id object = [[self alloc] init];
    
    NSArray *propertise = [self loadProperties];
    
    for (NSString *key in propertise) {
        if (dict[key] != nil) {
            [object setValue:dict[key] forKeyPath:key];
        }
    }
    //    [new setValuesForKeysWithDictionary:dict];
    
    return object;
}

#pragma mrak - 动态加载属性
// 动态加载类的属性

const char *KPropertiesKey = "KPropertiesKey";
+ (NSArray *)loadProperties {
    
    // 获取关联对象
    NSArray *pList = objc_getAssociatedObject(self, KPropertiesKey);
    if (pList != nil) {
        return pList;
    }
    // 属性计数指针
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    //    NSLog(@"%u",count);
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:count];
    // 遍历数组
    for (unsigned int i = 0; i < count; ++i) {
        
        objc_property_t pty = list[i];
        
        const char *Pname = property_getName(pty);
        [tempArray addObject:[NSString stringWithUTF8String:Pname]];
    }
    NSLog(@"%@",tempArray);
    
    // 释放对象
    free(list);
    
    // 设置关联对象
    objc_setAssociatedObject(self, KPropertiesKey, tempArray, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    
    return tempArray.copy;
}


@end
