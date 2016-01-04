//
//  ZZMeViewController.m
//  MIX
//
//  Created by zhou on 15/11/25.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZMyHomeViewController.h"
#import "ZZRankView.h"
#import "MacroDefinition.h"
#import "ZZProfileCell.h"
#import "ZZListCell.h"
#import "ZZConfiguration.h"
#import "ZZLoginViewController.h"
#import "ZZHttpClient.h"
#import "ZZSettingViewController.h"
#import "EXTScope.h"
#import "ZZHttpClient.h"
#import "MJRefresh.h"
#import "ZZProfileModel.h"
#import "ZZMyProfileViewController.h"




@interface ZZMyHomeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *settingItems;
@property (nonatomic, strong) ZZProfileModel *profileModel;


@end

@implementation ZZMyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xefeff4);
   
    [self configureTitles:@"我的主页"];
    @weakify(self)
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView reloadData];
        @strongify(self)
        [self.tableView.header endRefreshing];
    }];
    self.tableView.header.backgroundColor = kMainColor;
    [self.tableView.header beginRefreshing];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - UITableViewDataSource UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *item = (NSArray *)self.settingItems[section];
    return  item.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 && indexPath.section == 0) {
        return 216;
    }else {
        return 45;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.settingItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        static NSString *imageCellIdentifer = @"imageCellIdentifer";
       ZZProfileCell  *cell = [tableView dequeueReusableCellWithIdentifier:imageCellIdentifer];
        if (cell == nil) {
            cell = [[ZZProfileCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:imageCellIdentifer];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    
        [self configureProfileCell:cell];
        return cell;
    }else {
        static NSString *listCellIdentifer = @"listCellIdentifer";
        ZZListCell  *cell = [tableView dequeueReusableCellWithIdentifier:listCellIdentifer];
        if (cell == nil) {
            cell = [[ZZListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listCellIdentifer];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [self configureCell:cell indexPath:indexPath];

        return cell;

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 40;
    }
    return 20;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 点击最后一个cell不需要登录
    // 其他cell先要判断是否登录，如果未登录弹出登录控制器
    if (indexPath.section == 4 && indexPath.row == 0) {
        ZZSettingViewController *settingViewController = [[ZZSettingViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:settingViewController];
        [self presentViewController:navigationController animated:YES completion:nil];
    }else {
        if ([ZZConfiguration sharedConfigration].token.length == 0) {
            @weakify(self);
            ZZLoginViewController *loginViewController = [[ZZLoginViewController alloc] initWithFinishLogin:^{
                @strongify(self)
                [[ZZHttpClient sharedHTTPClient] requestUserProfileWithSuccessBlock:^(id data) {
                    ZZProfileModel *profileModel = [[ZZProfileModel alloc] initWithDictionary:data error:nil];
                    self.profileModel = profileModel;
                    [self.tableView.header beginRefreshing];
                } failBlock:^(NSError *error) {
                    
                    [self showText:@"服务器或者网络错误"];
                    NSLog(@"Failure");
                }];
                
            }];
            
            
            
            
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
            [self presentViewController:navigationController animated:YES completion:nil];
        }else{
            //!! 晚些替换成宏
            if (indexPath.section == 0 && indexPath.row == 0) {
                ZZMyProfileViewController *myProfileViewController = [[ZZMyProfileViewController alloc] init];
                [self.navigationController pushViewController:myProfileViewController animated:YES];
            
            } else if (indexPath.section == 1 && indexPath.row == 0) {
                
            
            
            }
       
        
        
        }
    }
    
    

}


#pragma mark - private

- (void)configureCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    NSArray *item = self.settingItems[indexPath.section];
    NSString *text = item[indexPath.row];
    cell.textLabel.text = text;
}

- (void)configureTopLineAtIndexPath:(NSIndexPath *)indexPath AtCell:(UITableViewCell *)cell{
    if (indexPath.row == 0) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
        lineView.backgroundColor = UIColorFromRGB(0xc8c7cc);
        [cell.contentView addSubview:lineView];
        
    }

}

- (void)configureProfileCell:(ZZProfileCell *)cell{
    if(self.profileModel != nil){
        ZZProfileModel *profileModel = self.profileModel;
        NSString *like = profileModel.data.likedVotes;
        NSString *honor = profileModel.data.badges;
        NSString *reputation = profileModel.data.rank;
        [cell updateLikeCount:like honorCount:honor reputationCount:reputation];
        [cell updateName:profileModel.data.name];
    }

}



#pragma mark - getter
- (NSArray *)settingItems{
    if (_settingItems == nil) {
         NSString *path = [[NSBundle mainBundle] pathForResource:@"setting" ofType:@"plist"];
        _settingItems = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _settingItems;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100);
        _tableView = [[UITableView alloc] initWithFrame:rect];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = UIColorFromRGB(0xefeff4);
        _tableView.showsVerticalScrollIndicator = YES;
        _tableView.bounces = YES;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}



@end
