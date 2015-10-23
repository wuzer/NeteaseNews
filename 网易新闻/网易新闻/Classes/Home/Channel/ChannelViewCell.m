//
//  ChannelViewCell.m
//  网易新闻
//
//  Created by Jefferson on 15/10/23.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "ChannelViewCell.h"
#import "NewsTableViewController.h"

@interface ChannelViewCell ()

@end

@implementation ChannelViewCell

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    
    self.newsVC.urlString = urlString;
    
}

// 不能设置大小，可以设置见面元素

- (void)awakeFromNib {

    UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"News" bundle:nil];
     self.newsVC = stroyboard.instantiateInitialViewController;
    
    [self addSubview:self.newsVC.view];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.newsVC.view.frame = self.bounds;
    
}

@end
