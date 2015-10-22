//
//  News.m
//  网易新闻
//
//  Created by Jefferson on 15/10/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "News.h"
#import <objc/runtime.h>
#import "NetworkTools.h"

@implementation News

// 字典转模型
+ (instancetype)newsWithDict:(NSDictionary *)dict {
    
    News *new = [[self alloc] init];
    
    NSArray *propertise = [self loadProperties];
    
    for (NSString *key in propertise) {
        if (dict[key] != nil) {
            [new setValue:dict[key] forKeyPath:key];
        }
    }
//    [new setValuesForKeysWithDictionary:dict];
    
    return new;
}

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

- (NSString *)description {

    NSArray *properties = [self.class loadProperties];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:properties];
    
    return [NSString stringWithFormat:@"<%@ : %p> %@",self.class,self,dict];
}

// 加载网络数据
+ (void)loadDataWithURLString:(NSString *)urlStr finished:(void (^)(NSArray *))finished{
    
    NSAssert(finished != nil, @"必须传完成回调");
    
    [[NetworkTools sharedNetworkTools] GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
//        NSLog(@"%@",array);
        NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:array.count];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [tempArray addObject:[self newsWithDict:obj]];
        }];
//        NSLog(@"%@",tempArray);
        
        finished(tempArray.copy);
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"数据加载失败");
    }];
}

@end
