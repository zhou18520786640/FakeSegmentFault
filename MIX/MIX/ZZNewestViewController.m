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
#import "ZZNewestModel.h"
#import "MBProgressHUD.h"
#import "EXTScope.h"

@interface ZZNewestViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, assign) NSInteger page; //当前所在的分页数
@property (nonatomic, strong) ZZNewestModel *newestModel;

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
        [self refreshData];
    }];
    [self.view addSubview:self.tableView];
    self.page = 1;
    [self.tableView.header beginRefreshing]; // 代码可以实现。也可以手动实现
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self)
        [self refreshData];

    }];
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
- (void)refreshData{
    NSMutableDictionary  *parameters = [NSMutableDictionary dictionary];
    parameters[@"page"] = @(self.page);
    @weakify(self);
    [[ZZHttpClient sharedHTTPClient] GET:@"/question/newest" parameters:parameters success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        @strongify(self);
        ZZNewestModel *newestModel = [[ZZNewestModel alloc] initWithDictionary:responseObject error:nil];
        self.newestModel = newestModel;
        if (newestModel.status == 0) {
            [self.tableView.header endRefreshing];
            [self showText:@"获取数据成功"];
            // 解析过程和铺UI明天做完
            [self.tableView reloadData];
        }else{
        
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        @strongify(self);
        [self showText:@"网络错误"];

        [self.tableView.header endRefreshing];

    }];


}


- (void)showText:(NSString*)str
{
    if ([str length] > 0) {
        UIView *view = [[UIApplication sharedApplication].delegate window];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        
        hud.removeFromSuperViewOnHide = YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = str;
        [view addSubview:hud];
        
        [hud show:YES];
        [hud hide:YES afterDelay:1.5];
    }
    
}


@end
