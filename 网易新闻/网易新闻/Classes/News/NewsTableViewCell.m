//
//  NewsTableViewCell.m
//  网易新闻
//
//  Created by Jefferson on 15/10/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "News.h"
#import <UIImageView+AFNetworking.h>

@interface NewsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;

@end

@implementation NewsTableViewCell

- (void)setNews:(News *)news {
    _news = news;
    
    self.title.text = news.title;
    self.digestLabel.text = news.digest;
    self.replyCount.text = [NSString stringWithFormat:@"%d",news.replyCount];
    
    [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
}

- (void)awakeFromNib {
    
    self.digestLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - self.digestLabel.frame.origin.x - 16;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
