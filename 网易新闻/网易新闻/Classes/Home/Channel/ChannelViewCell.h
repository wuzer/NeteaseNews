//
//  ChannelViewCell.h
//  网易新闻
//
//  Created by Jefferson on 15/10/23.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsTableViewController;

@interface ChannelViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *urlString;

@property (nonatomic, strong) NewsTableViewController *newsVC;

@end
