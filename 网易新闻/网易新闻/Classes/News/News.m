//
//  News.m
//  网易新闻
//
//  Created by Jefferson on 15/10/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "News.h"
#import "NetworkTools.h"

@implementation News

+ (instancetype)newsWithDict:(NSDictionary *)dict {
    
    News *new = [[self alloc] init];
    
    [new setValuesForKeysWithDictionary:dict];
    
    return new;
}

+ (void)loadDataWithURLString:(NSString *)urlStr {
    
    [[NetworkTools sharedNetworkTools] GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"数据加载失败");
    }];
}


@end
