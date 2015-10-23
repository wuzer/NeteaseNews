//
//  ChannelLabel.m
//  网易新闻
//
//  Created by Jefferson on 15/10/23.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "ChannelLabel.h"

#define KnormalFontSize 14.0
#define KSelectedFontSize 18.0

@implementation ChannelLabel

+ (instancetype)channelLabelWithTitle:(NSString *)title {
    
    ChannelLabel *label = [[ChannelLabel alloc] init];
    
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    
    // 先设置大字体预留出空间
    label.font = [UIFont systemFontOfSize:KSelectedFontSize];
    [label sizeToFit];
    
    // 然后设置小字体回复正常
    label.font = [UIFont systemFontOfSize:KnormalFontSize];
    
    return label;
}

@end
