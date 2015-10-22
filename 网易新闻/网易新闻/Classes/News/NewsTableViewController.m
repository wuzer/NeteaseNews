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

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:reuseID];
    
    __weak typeof(self) weakSelf = self;
    [News loadDataWithURLString:@"T1348649580692/0-20.html" finished:^(NSArray *newsList) {
        weakSelf.newsList = newsList;
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newsList.count;
}

static NSString *reuseID = @"newsCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    
    cell.news = self.newsList[indexPath.row];
//    NSLog(@"%@",self.newsList);
    
    return cell;
}




@end
