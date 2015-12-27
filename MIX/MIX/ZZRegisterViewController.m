//
//  ZZRegisterViewController.m
//  MIX
//
//  Created by zhou on 15/12/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZRegisterViewController.h"

@interface ZZRegisterViewController ()
// 可滚动的背景
@property (nonatomic, strong) UIScrollView *backgroundScrollView;

// 输入的内容
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *EmailTextField;
@property (nonatomic, strong) UITextField *passwordTextField;

// 注册按钮
@property (nonatomic, strong) UIButton *registerButton;


@end

@implementation ZZRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureTitles:@"注册账号"];
    [self configureCancelBarItem];
    
}

#pragma mark - Target Action 
- (void)leftButtonDidPressed {
    [self dismissViewControllerAnimated:YES completion:nil];


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



#pragma mark - getter 
- (UIScrollView *)backgroundScrollView{
    if (_backgroundScrollView == nil) {
        _backgroundScrollView = [[UIScrollView alloc] initWithFrame:self.view.
                                 bounds];
        
        [self.view addSubview:_backgroundScrollView];
    }
    return _backgroundScrollView;
}











@end
