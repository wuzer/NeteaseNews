//
//  Channel.m
//  网易新闻
//
//  Created by Jefferson on 15/10/23.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "Channel.h"
#import "NSObject+JFExtension.h"

@implementation Channel

- (void)setTid:(NSString *)tid {
    _tid = tid.copy;
    
    _urlString = [NSString stringWithFormat:@"%@/0-40.html",tid];

}

+ (NSArray *)channelList {

    // 加载 json 的二进制数据
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news" ofType:@".json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    // json 的反序列化
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];

    // 获得字典数据
    NSArray *list = dict[dict.keyEnumerator.nextObject];
    
    // 遍历数组
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:list.count];
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tempArray addObject:[self objectWithDict:obj]];
    }];
    
//    NSLog(@"%@",tempArray);
    
    // 针对 tid 做一个排序
    return [tempArray sortedArrayUsingComparator:^NSComparisonResult(Channel *obj1, Channel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
}

- (NSString *)description {
    
    NSArray *properties = [self.class loadProperties];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:properties];
    
    return [NSString stringWithFormat:@"<%@ : %p> %@",self.class,self,dict];
}


@end
