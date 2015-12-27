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
    [self configureTitles:@"注册账号"];
    [self configureCancelBarItem];
    
}


#pragma mark - private method
- (void)configureCancelBarItem {
//    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    


}










@end
