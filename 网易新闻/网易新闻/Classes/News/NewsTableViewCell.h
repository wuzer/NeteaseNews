//
//  NewsTableViewCell.h
//  网易新闻
//
//  Created by Jefferson on 15/10/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;

@interface NewsTableViewCell : UITableViewCell

@property (nonatomic, strong) News *news;

+ (NSString *)cellIdentifier:(News *)news;

@end
