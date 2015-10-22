//
//  News.h
//  网易新闻
//
//  Created by Jefferson on 15/10/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *replyCount;

+ (instancetype)newsWithDict:(NSDictionary *)dict;

+ (void)loadDataWithURLString:(NSString *)urlStr;

@end
