//
//  News.m
//  网易新闻
//
//  Created by Jefferson on 15/10/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "News.h"
#import "NetworkTools.h"
#import "NSObject+JFExtension.h"

@implementation News

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
            [tempArray addObject:[self objectWithDict:obj]];
        }];
//        NSLog(@"%@",tempArray);
        
        finished(tempArray.copy);
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"数据加载失败");
    }];
}

@end
