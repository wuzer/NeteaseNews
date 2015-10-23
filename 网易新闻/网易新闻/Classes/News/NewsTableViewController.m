//
//  NewsTableViewController.m
//  网易新闻
//
//  Created by Jefferson on 15/10/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsTableViewCell.h"

@interface NewsTableViewController ()

@property (nonatomic, strong) NSArray *newsList;

@end

@implementation NewsTableViewController

- (void)setNewsList:(NSArray *)newsList {
    
    _newsList = newsList;
    
    
    [self.tableView reloadData];
}

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    
    // 清空缓存
    self.newsList = nil;
    
    __weak typeof(self) weakSelf = self;
    [News loadDataWithURLString:urlString finished:^(NSArray *newsList) {
        weakSelf.newsList = newsList;
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置预估行高
    self.tableView.estimatedRowHeight = 80;
    
    // 自动计算行高
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newsList.count;
}

static NSString *reuseID = @"newsCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    News *new = self.newsList[indexPath.row];
    NSString *ID = [NewsTableViewCell cellIdentifier:new];
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    
    cell.news = new;
//    NSLog(@"%@",self.newsList);
    
    return cell;
}




@end
