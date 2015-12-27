//
//  ZZLoginViewController.m
//  MIX
//
//  Created by zhou on 15/12/24.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZLoginViewController.h"
#import "ZZLoginInputView.h"
#import "MacroDefinition.h"
#import "ZZHttpClient.h"
#import "EXTScope.h"

@interface ZZLoginViewController ()

@property (nonatomic, strong) UIScrollView *backgroundScrollView;
@property (nonatomic, strong) UILabel *loginTipLabel;
@property (nonatomic, strong) ZZLoginInputView *loginInputView;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *retrivePasswordButton;
@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation ZZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColorFromRGB(0xefeff4);
    [self configureTitles:@"登录"];
    [self configureSubViews];
    [self configureLeftBarItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)configureSubViews{
 
    
    self.backgroundScrollView.contentSize = self.view.bounds.size;
    [self.backgroundScrollView addSubview:self.loginInputView];
    
    self.loginButton.frame = CGRectMake(0, CGRectGetMaxY(_loginInputView.frame) + 16, 346, 45);
    self.loginButton.center = CGPointMake(self.view.bounds.size.width * 0.5, _loginButton.center.y);
    
    [self.backgroundScrollView addSubview:self.loginButton];
    
    self.loginTipLabel.frame = CGRectMake(0, 122, self.view.bounds.size.width, 15);
    [self.backgroundScrollView addSubview:self.loginTipLabel];
    
    
}

- (void)configureLeftBarItem {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setTitle:@"关闭" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}


- (void)buttonDidPressed:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];


}

#pragma mark - target action
- (void)loginButtonDidPressed:(UIButton *)button {
    [self showLoading];
    @weakify(self);
    [[ZZHttpClient sharedHTTPClient] requestLoginWithName:_loginInputView.emailText password:_loginInputView.passwordText SuccessBlock:^(id data) {
        @strongify(self);
        [self hideLoading];

        
    } failBlock:^(id error) {
        @strongify(self);
        [self hideLoading];
    }];

}

#pragma mark - 
- (UIScrollView *)backgroundScrollView{
    if (_backgroundScrollView == nil) {
        _backgroundScrollView = [[UIScrollView alloc] initWithFrame:self.view.
                                 bounds];
        
        [self.view addSubview:_backgroundScrollView];
    }
    return _backgroundScrollView;
}


- (ZZLoginInputView *)loginInputView {
    if (_loginInputView == nil) {
        _loginInputView = [[ZZLoginInputView alloc] initWithFrame:CGRectMake(0, 169, [UIScreen mainScreen].bounds.size.width, 100)];
    }
    return  _loginInputView;
}

- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginButtonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
        _loginButton.layer.cornerRadius = 4;
        _loginButton.backgroundColor = kMainColor;
    }
    return _loginButton;

}

- (UILabel *)loginTipLabel {
    if (_loginTipLabel == nil) {
        _loginTipLabel = [[UILabel alloc] init];
        _loginTipLabel.text = @"或者本站账号登录";
        _loginTipLabel.font = [UIFont systemFontOfSize:15];
        _loginTipLabel.textAlignment = NSTextAlignmentCenter;
        _loginTipLabel.textColor = UIColorFromRGB(0x757575);
    }
    return _loginTipLabel;
}


@end
