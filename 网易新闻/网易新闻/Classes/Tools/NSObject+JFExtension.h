//
//  NSObject+JFExtension.h
//  网易新闻
//
//  Created by Jefferson on 15/10/23.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JFExtension)

// 字典转模型
+ (instancetype)objectWithDict:(NSDictionary *)dict;

// 动态加载累的属性
+ (NSArray *)loadProperties;

@end
