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

@interface ZZMyHomeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *settingItems;

@property (nonatomic, strong) ZZRankView *rankView;
@end

@implementation ZZMyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xefeff4);
   
    [self configureTitles:@"我的主页"];
    [self.tableView reloadData];

    
}

#pragma mark - UITableViewDataSource UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *item = (NSArray *)self.settingItems[section];
    return  item.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 && indexPath.section == 0) {
        return 150;
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
        return cell;
    }else {
        static NSString *listCellIdentifer = @"listCellIdentifer";
        ZZListCell  *cell = [tableView dequeueReusableCellWithIdentifier:listCellIdentifer];
        if (cell == nil) {
            cell = [[ZZListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listCellIdentifer];
            [self configureCell:cell indexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        return cell;

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 40;
    }
    return 20;
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
