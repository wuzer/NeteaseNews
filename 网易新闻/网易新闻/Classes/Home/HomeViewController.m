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
#import "ChannelViewCell.h"
#import "NewsTableViewController.h"

@interface HomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *channleList;

@property (weak, nonatomic) IBOutlet UIScrollView *channelView;
@property (weak, nonatomic) IBOutlet UICollectionView *CollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@property (nonatomic, assign) NSInteger currentIndex;

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
    [super viewDidLayoutSubviews];
    
    self.layout.itemSize = self.CollectionView.bounds.size;
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 允许分页
    self.CollectionView.pagingEnabled = YES;
    self.CollectionView.showsHorizontalScrollIndicator = false;
    
}

#pragma mark - Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.channleList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ChannelViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channelCell" forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:0.9];
    
    // 添加数据
    cell.urlString = [self.channleList[indexPath.item] urlString];
    
    if (![self.childViewControllers containsObject:cell.newsVC]) {
        [self addChildViewController:cell.newsVC];
    }
    
    
//    NSLog(@"%@",self.childViewControllers);
    
    return cell;
}

// 添加频道数据

- (void)loadChannleData {
    
    // 取消自动缩进
    self.automaticallyAdjustsScrollViewInsets = false;
    self.channelView.showsHorizontalScrollIndicator = false;
    
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
    
    self.currentIndex = 0;
}

#pragma mark - delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 当前选中标签
    ChannelLabel *currentLabel = self.channelView.subviews[self.currentIndex];
    NSLog(@"%@",currentLabel.text);

}


#pragma mark - lazy load

- (NSArray *)channleList {
    
    if (!_channleList) {
        _channleList = [Channel channelList];
    }
    return _channleList;
}

@end
