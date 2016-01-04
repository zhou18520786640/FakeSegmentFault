//
//  ZZMyProfileViewController.m
//  MIX
//
//  Created by zhou on 16/1/4.
//  Copyright © 2016年 jeff.zhou. All rights reserved.
//

#import "ZZMyProfileViewController.h"
#import "ZZHttpClient.h"
#import "EXTScope.h"
#import "ZZInformationModel.h"

@interface ZZMyProfileViewController ()
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ZZMyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource = @[@"头像",@"用户名",@"性别",@"生日",@"现居城市",@"通讯地址",@"个人网站",@"简介"];

    [self requestMe];
    
}

- (void)requestMe{
    @weakify(self)
    [[ZZHttpClient sharedHTTPClient] requestMeWithSuccessBlock:^(id data) {
       @strongify(self)
        ZZInformationModel *informationModel = [[ZZInformationModel alloc] initWithDictionary:data error:nil];
        if (informationModel.status == 0) {
            [self handleInformationResponse:informationModel.data];
        }


    } failBlock:^(id data) {
        @strongify(self)
      
        
    
    }];


}

- (void)handleInformationResponse:(ZZInformationDataModel *)dataModel{


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
