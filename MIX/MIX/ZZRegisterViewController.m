//
//  ZZRegisterViewController.m
//  MIX
//
//  Created by zhou on 15/12/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZRegisterViewController.h"
#import "ZZRegisterView.h"
#import "ZZHttpClient.h"

@interface ZZRegisterViewController ()
@property (nonatomic, strong) ZZRegisterView *registerView;
@end

@implementation ZZRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.registerView = [[ZZRegisterView alloc] initWithFrame:self.view.bounds withRegisterViewClickBlock:nil];
    self.view = self.registerView;
    
    [self configureTitles:@"注册账号"];
    [self configureCancelBarItem];
    
}




#pragma mark - private method
- (void)configureCancelBarItem {
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 44, 44);
    [leftButton setTitle:@"取消" forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonDidPressed) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}


#pragma mark - target action 
- (void)leftButtonDidPressed {
    [self dismissViewControllerAnimated:YES completion:nil];
}











@end
