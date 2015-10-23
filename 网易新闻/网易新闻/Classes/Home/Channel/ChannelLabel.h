//
//  ChannelLabel.h
//  网易新闻
//
//  Created by Jefferson on 15/10/23.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChannelLabelDelegate;

@interface ChannelLabel : UILabel

+ (instancetype)channelLabelWithTitle:(NSString *)title;

@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, weak) id<ChannelLabelDelegate>delegate;

@end

@protocol ChannelLabelDelegate <NSObject>

- (void)channelLabelDidSelected:(ChannelLabel *)label;

@end