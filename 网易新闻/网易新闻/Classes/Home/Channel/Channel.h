//
//  Channel.h
//  网易新闻
//
//  Created by Jefferson on 15/10/23.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject

@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *tid;

+ (NSArray *)channelList;

@end
