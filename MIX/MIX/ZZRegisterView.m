//
//  ZZRegisterView.m
//  MIX
//
//  Created by zhou on 16/1/1.
//  Copyright © 2016年 jeff.zhou. All rights reserved.
//

#import "ZZRegisterView.h"
#import "MacroDefinition.h"
@interface ZZRegisterView ()
//用户名
@property (nonatomic, strong) UITextField *userTextField;
// 密码
@property (nonatomic, strong) UITextField *EmailTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIScrollView *backgroundScrollView;
// 注册按钮
@property (nonatomic, strong) UIButton *registerButton;

@property (nonatomic, copy) ZZRegisterViewClickBlock block;
@end

@implementation ZZRegisterView
- (instancetype)initWithFrame:(CGRect)frame withRegisterViewClickBlock:(ZZRegisterViewClickBlock)block {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xefeff4);
        self.block = block;
        [self configureSubviews];
    }
    return self;
}

- (void)configureSubviews {
    self.backgroundScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.backgroundScrollView.bounces = YES;
    self.backgroundScrollView.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height + 5);
    [self addSubview:self.backgroundScrollView];
    
    // 用户名
    UILabel *userTextFieldBackgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.bounds.size.width, 45)];
    userTextFieldBackgroundLabel.backgroundColor = [UIColor whiteColor];
    [self.backgroundScrollView addSubview:userTextFieldBackgroundLabel];
    
    self.userTextField = [[UITextField alloc] initWithFrame:CGRectMake(24, 0, self.bounds.size.width - 24 , 45)];
    self.userTextField.backgroundColor = [UIColor blackColor];
    self.userTextField.placeholder = @"用户名";
    [userTextFieldBackgroundLabel addSubview:self.userTextField];
    
    

    
    
    // 邮箱
    UILabel *emailFieldBackgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(userTextFieldBackgroundLabel.frame), self.bounds.size.width, 45)];
    emailFieldBackgroundLabel.backgroundColor = [UIColor whiteColor];
    [self.backgroundScrollView addSubview:emailFieldBackgroundLabel];
    
    self.EmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(24, 0, self.bounds.size.width - 24, 45)];
    self.EmailTextField.backgroundColor = [UIColor blackColor];
    self.EmailTextField.placeholder = @"邮箱";
    [emailFieldBackgroundLabel addSubview:self.EmailTextField];

    
    // 密码
    UILabel *passwordTextFieldBackgroundLabel  = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(emailFieldBackgroundLabel.frame), self.bounds.size.width, 45)];
    passwordTextFieldBackgroundLabel.backgroundColor = [UIColor whiteColor];
    [self.backgroundScrollView addSubview:passwordTextFieldBackgroundLabel];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(24, 0, self.bounds.size.width - 24, 45)];
    self.passwordTextField.backgroundColor = [UIColor blackColor];
    self.passwordTextField.placeholder = @"密码";
    [passwordTextFieldBackgroundLabel addSubview:self.passwordTextField];

    
    // 注册
    self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerButton.frame = CGRectMake(0, CGRectGetMaxY(passwordTextFieldBackgroundLabel.frame) + 35, 345, 45);
    self.registerButton.center = CGPointMake(self.bounds.size.width * 0.5, self.registerButton.center.y);
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    self.registerButton.backgroundColor = kMainColor;
    [self.registerButton addTarget:self action:@selector(registerButtonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.backgroundScrollView addSubview:self.registerButton];
}

- (void)registerButtonDidPressed:(UIButton *)button {
    if (self.block) {
        NSString *text = self.userTextField.text;
        NSString *email = self.EmailTextField.text;
        NSString *password = self.passwordTextField.text;
        self.block(text, email, password);
    }

}

@end
