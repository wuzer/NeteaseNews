//
//  NetworkTools.m
//  网易新闻
//
//  Created by Jefferson on 15/10/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools

+ (instancetype)sharedNetworkTools {
    
    static NetworkTools *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        
        instance = [[self alloc] initWithBaseURL:url];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    
    return instance;
}


@end
