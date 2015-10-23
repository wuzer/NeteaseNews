//
//  HomeViewController.m
//  网易新闻
//
//  Created by Jefferson on 15/10/23.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "HomeViewController.h"
#import "Channel.h"
#import "ChannelLabel.h"

@interface HomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *channleList;

@property (weak, nonatomic) IBOutlet UIScrollView *channelView;
@property (weak, nonatomic) IBOutlet UICollectionView *CollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.CollectionView.dataSource = self;
    
    [self loadChannleData];
    NSLog(@"%s -- %@",__func__,NSStringFromCGRect(self.CollectionView.frame));

}

- (void)viewDidLayoutSubviews {
    NSLog(@"%s -- %@",__func__,NSStringFromCGRect(self.CollectionView.frame));
}

#pragma mark - Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.channleList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channelCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:0.9];
    return cell;
}

// 添加频道数据

- (void)loadChannleData {
    
    // 取消自动缩进
    self.automaticallyAdjustsScrollViewInsets = false;
    
    CGFloat margin = 8;
    CGFloat x = margin;
    CGFloat height = self.channelView.bounds.size.height;
    
    for (Channel *channel in self.channleList) {
        
        ChannelLabel *label = [ChannelLabel channelLabelWithTitle:channel.tname];
        
        label.frame = CGRectMake(x, 0, label.bounds.size.width, height);
        
        x += label.bounds.size.width;
//        NSLog(@"%@",NSStringFromCGRect(label.frame));
        [self.channelView addSubview:label];
    }
    self.channelView.contentSize = CGSizeMake(x + margin, height);
}


#pragma mark - lazy load

- (NSArray *)channleList {
    
    if (!_channleList) {
        _channleList = [Channel channelList];
    }
    return _channleList;
}

@end
