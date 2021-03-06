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
#import "ZZRegisterViewController.h"
#import "ZZLoginModel.h"
#import "ZZConfiguration.h"
#import "ZZLoginThirdPartyView.h"
#import <FrameAccessor/ViewFrameAccessor.h>
#import <ShareSDK/ShareSDK.h>



@interface ZZLoginViewController ()

@property (nonatomic, copy) FinishLoginBlock finishLoginBlock;
@property (nonatomic, strong) ZZLoginThirdPartyView *loginThirdPartyView;
@property (nonatomic, strong) UIScrollView *backgroundScrollView;
@property (nonatomic, strong) UILabel *loginTipLabel;
@property (nonatomic, strong) ZZLoginInputView *loginInputView;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *retrivePasswordButton;
@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation ZZLoginViewController

- (instancetype)initWithFinishLogin:(FinishLoginBlock)finishLoginBlock {
    self = [super init];
    if (self) {
        self.finishLoginBlock = finishLoginBlock;
    }
    
    return self;

}

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
 
    // scrollView
    self.backgroundScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height + 160);
    self.backgroundScrollView.bounces = YES;
    [self.backgroundScrollView addSubview:self.loginInputView];
    
    
    // 宽度,高度自适应
    CGRect rect = CGRectMake(0, 41, 0, 0);
    @weakify(self)
    ZZLoginThirdPartyView *loginThirdPartyView = [[ZZLoginThirdPartyView alloc] initWithFrame:rect thirdPartyIconDidPressedblock:^(ZZLoginThirdPartyViewType type) {
        @strongify(self)
        
        
        
    }];
    loginThirdPartyView.centerX =  self.view.width * 0.5;
    [self.backgroundScrollView addSubview:loginThirdPartyView];
    
    // 登录按钮
    self.loginButton.frame = CGRectMake(0, CGRectGetMaxY(_loginInputView.frame) + 16, 346, 45);
    self.loginButton.center = CGPointMake(self.view.bounds.size.width * 0.5, _loginButton.center.y);
    [self.backgroundScrollView addSubview:self.loginButton];
    
    // 提示文案
    self.loginTipLabel.frame = CGRectMake(0, 122, self.view.bounds.size.width, 15);
    [self.backgroundScrollView addSubview:self.loginTipLabel];
    
    // 注册按钮
    self.registerButton.frame = CGRectMake(74, CGRectGetMaxY(self.loginButton.frame) + 50, 60, 15);
    [self.backgroundScrollView addSubview:self.registerButton];
    
    self.retrivePasswordButton.frame = CGRectMake(0, self.loginButton.bottom + 50, 60, 15);
    self.retrivePasswordButton.right = self.view.width - 74;
    [self.backgroundScrollView addSubview:self.retrivePasswordButton];
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
    [[ZZHttpClient sharedHTTPClient] requestLoginWithName:_loginInputView.emailText password:_loginInputView.passwordText SuccessBlock:^(NSDictionary *data) {
        @strongify(self);
        [self hideLoading];
        
        
    

        ZZLoginModel *loginModel = [[ZZLoginModel alloc] initWithDictionary:data error:nil];
        if (loginModel.status == 0) {
            [ZZConfiguration sharedConfigration].token = loginModel.data.token;
            [ZZConfiguration sharedConfigration].userID = loginModel.data.user.userID;
            [self dismissViewControllerAnimated:YES completion:nil];
            if (self.finishLoginBlock) {
                self.finishLoginBlock();
            }
        }else {

            [self showText:@"服务器或网络异常,请重试"];

        
        }
    } failBlock:^(id error) {
        @strongify(self);
        [self hideLoading];
        [self showText:@"服务器或网络异常,请重试"];
    }];

}

- (void)registerButtonDidPressed:(UIButton *)button {
    ZZRegisterViewController *registerViewController = [[ZZRegisterViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:registerViewController];
    [self presentViewController:navigationController animated:YES completion:nil];

}


- (void)retrivePasswordButtonDidPressed:(UIButton *)button {
    NSLog(@"找回密码log");


}


#pragma mark - setter and getter

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

- (UIButton *)registerButton{
    if (_registerButton == nil) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitle:@"注册账号" forState:UIControlStateNormal];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _registerButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_registerButton addTarget:self action:@selector(registerButtonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_registerButton setTitleColor:UIColorFromRGB(0xa4a4a4) forState:UIControlStateNormal];
        
    }
    return _registerButton;

}

- (UIButton *)retrivePasswordButton {
    if (_retrivePasswordButton == nil) {
        _retrivePasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_retrivePasswordButton setTitle:@"找回密码" forState:UIControlStateNormal];
        _retrivePasswordButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _retrivePasswordButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_retrivePasswordButton addTarget:self action:@selector(retrivePasswordButtonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_retrivePasswordButton setTitleColor:UIColorFromRGB(0xa4a4a4) forState:UIControlStateNormal];
        
    }
    return _retrivePasswordButton;

}



@end
