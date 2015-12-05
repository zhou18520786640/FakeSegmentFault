//
//  ZZNewestViewController.m
//  MIX
//
//  Created by zhou on 15/11/25.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZNewestViewController.h"
#import "ZZNewestCell.h"
#import "ZZHttpClient.h"
#import "MJRefresh.h"
#import "ZZNewestListModel.h"
#import "ZZNewestListItem.h"
#import "EXTScope.h"

@interface ZZNewestViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, assign) NSInteger page; //当前所在的分页数
@property (nonatomic, strong) NSMutableArray<ZZNewestListItemModel *> *newestListItems;
@property (nonatomic, assign) BOOL isLastPage;



@end

@implementation ZZNewestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    @weakify(self);
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self)
        self.page = 1;
        [self refreshDataWithPage:self.page];
    }];
    [self.view addSubview:self.tableView];
    
    [self.tableView.header beginRefreshing]; // 代码可以实现。也可以手动实现
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self)
        self.page++;
        [self refreshDataWithPage:self.page];

    }];
    
    self.newestListItems = [[NSMutableArray alloc] init];
}


#pragma mark - UITableViewDelegate UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const tableViewReuseIdentifer = @"tableViewReuseIdentifer";
    ZZNewestCell *newestCell = [tableView dequeueReusableCellWithIdentifier:tableViewReuseIdentifer];
    if (newestCell == nil) {
        newestCell = [[ZZNewestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewReuseIdentifer];
    }
    newestCell.textLabel.text = @"测试";
    
    return newestCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

}


#pragma mark - custom
- (void)refreshDataWithPage:(NSInteger)page{
    NSMutableDictionary  *parameters = [NSMutableDictionary dictionary];
    parameters[@"page"] = @(page);
    @weakify(self);
    [[ZZHttpClient sharedHTTPClient] GET:@"/question/newest" parameters:parameters success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        @strongify(self);
        ZZNewestListModel *newestListModel = [[ZZNewestListModel alloc] initWithDictionary:responseObject error:nil];
        if (newestListModel.status == 0) {
            
            [self.tableView.header endRefreshing];
            [self showText:@"获取数据成功"];
            
            // 如果是加载第一个数据
            if (self.page == 1) {
                [self.newestListItems removeAllObjects];
            }
            
            // 更新数据源
            NSArray *newestListItemModel = newestListModel.data.items;
            [self.newestListItems addObjectsFromArray:newestListItemModel];
            
            
            [self.tableView reloadData];
        }else{
            [self handleNewestListResponseFailure];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        @strongify(self);
        [self handleNewestListResponseFailure];

   
    }];

}

- (void)handleNewestListResponseFailure{
    [self showText:@"网络错误，请重试"];
    [self.tableView.footer endRefreshing];
    [self.tableView.header endRefreshing];
    if(self.page > 1){
        self.page -= 1;
    }else{
        self.page = 1;  // 1无法再减
    }
}

@end
