//
//  ZZLoginViewController.m
//  MIX
//
//  Created by zhou on 15/12/24.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZLoginViewController.h"
#import "ZZLoginInputView.h"

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

#pragma mark - 
- (UIScrollView *)backgroundScrollView{
    if (_backgroundScrollView == nil) {
        _backgroundScrollView = [[UIScrollView alloc] initWithFrame:self.view.
                                 bounds];
        
        [self.view addSubview:_backgroundScrollView];
    }
    return _backgroundScrollView;
}




@end
