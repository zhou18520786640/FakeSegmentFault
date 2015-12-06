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
#import "MacroDefinition.h"

@interface ZZNewestViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, assign) NSInteger page; //当前所在的分页数
@property (nonatomic, strong) NSMutableArray<ZZNewestListItemModel *> *newestListItems;
@property (nonatomic, assign) BOOL isLastPage; // 是否是最后一页
@property (nonatomic, assign) BOOL isPageLoading; // 是否正在加载分页



@end

@implementation ZZNewestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    @weakify(self);
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self)
        NSLog(@"do");
        if (self.isPageLoading == NO) {
            self.page = 1;
            [self refreshDataWithPage:self.page];
        }else{
            [self.tableView.header endRefreshing];
        }
    }];
    [self.view addSubview:self.tableView];
    
    [self.tableView.header beginRefreshing];
    
    
    


    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        @strongify(self)
        if(self.isLastPage == NO){ // 如果不是是最后一页的话
            if(self.isPageLoading == NO){
                self.page += 1;
                [self refreshDataWithPage:self.page];
            }else{
                [self.tableView.footer endRefreshing];
            }
        }else{
            [self.tableView.footer endRefreshing];
            [self showText:@"没有数据了"];
        }

    }];
    [footer setTitle:@"Drag up to load more" forState:MJRefreshStateIdle];
    [footer setTitle:@"Release to load more" forState:MJRefreshStatePulling];
    [footer setTitle:@"Loading more ..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"No more data" forState:MJRefreshStateNoMoreData];
    self.tableView.footer = footer;
    self.newestListItems = [[NSMutableArray alloc] init];
}


#pragma mark - UITableViewDelegate UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const tableViewReuseIdentifer = @"tableViewReuseIdentifer";
    ZZNewestCell *newestCell = [tableView dequeueReusableCellWithIdentifier:tableViewReuseIdentifer];
    if (newestCell == nil) {
        newestCell = [[ZZNewestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewReuseIdentifer];
//        newestCell.selectedBackgroundView = [[UIView alloc] initWithFrame:newestCell.frame];
//        newestCell.selectedBackgroundView.backgroundColor = UIColorFromRGB(0x)
    }

    
    [newestCell updateWithNewestModel:self.newestListItems[indexPath.row]];
    return newestCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newestListItems.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     ZZNewestCell *newestCell = (ZZNewestCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return newestCell.frame.size.height;
}


#pragma mark - custom
- (void)refreshDataWithPage:(NSInteger)page{
    NSMutableDictionary  *parameters = [NSMutableDictionary dictionary];
    parameters[@"page"] = @(page);
    @weakify(self);
    parameters[@"token"] = @"2b3aa3e88894040e148a7ad740185173";
    self.isPageLoading = YES;
    [[ZZHttpClient sharedHTTPClient] GET:@"/question/newest" parameters:parameters success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        @strongify(self);
        self.isPageLoading = NO;
        
        ZZNewestListModel *newestListModel = [[ZZNewestListModel alloc] initWithDictionary:responseObject error:nil];
        if (newestListModel.status == 0) {  // 成功
            
            [self.tableView.header endRefreshing];
            [self.tableView.footer endRefreshing];
            
            // 如果是加载第一个数据
            if (self.page == 1) {
                [self.newestListItems removeAllObjects];
            }

            // 更新数据源
            NSArray *newestListItemModel = newestListModel.data.items;
            [self.newestListItems addObjectsFromArray:newestListItemModel];
            
            
            // 计算是不是最后一页
            BOOL isLastPage = (self.newestListItems.count >= newestListModel.data.page.total);
            self.isLastPage = isLastPage;
            
            
            [self.tableView reloadData];
        }else{
            [self handleNewestListResponseFailure];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        @strongify(self);
        self.isPageLoading = NO;
        [self handleNewestListResponseFailure];

    }];

}

- (void)handleNewestListResponseFailure{
    [self showText:@"网络错误，请重试"];
    [self.tableView.footer endRefreshing];
    [self.tableView.header endRefreshing];
    if(self.page >=1){
        self.page -= 1;
    }
}

@end
