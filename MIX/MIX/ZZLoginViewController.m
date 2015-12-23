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
    [self configureSubViews];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)configureSubViews{
    self.backgroundScrollView.contentSize = self.view.bounds.size;
    
    [self.backgroundScrollView addSubview:self.loginInputView];
    [self.backgroundScrollView addSubview:self.loginTipLabel];
    

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
