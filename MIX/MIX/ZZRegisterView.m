//
//  ZZRegisterView.m
//  MIX
//
//  Created by zhou on 16/1/1.
//  Copyright © 2016年 jeff.zhou. All rights reserved.
//

#import "ZZRegisterView.h"
#import "MacroDefinition.h"
@interface ZZRegisterView () <UITextFieldDelegate>
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
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 34, self.bounds.size.width, 1)];
    lineView.backgroundColor = UIColorFromRGB(0xc8c7cc);
    [self.backgroundScrollView addSubview:lineView];
    UIView *userTextFieldBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 35, self.bounds.size.width, 45)];
    userTextFieldBackgroundView.backgroundColor = [UIColor whiteColor];
    [self.backgroundScrollView addSubview:userTextFieldBackgroundView];
    
    self.userTextField = [[UITextField alloc] initWithFrame:CGRectMake(24, 0, self.bounds.size.width - 24 , 45)];
    self.userTextField.backgroundColor = [UIColor whiteColor];
    self.userTextField.placeholder = @"用户名";
    self.userTextField.returnKeyType = UIReturnKeyNext;
    self.userTextField.delegate = self;
    [userTextFieldBackgroundView addSubview:self.userTextField];
    
    

    
    
    // 邮箱
    // 用户名
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(25, CGRectGetMaxY(userTextFieldBackgroundView.frame) - 1, self.bounds.size.width, 1)];
    lineView2.backgroundColor = UIColorFromRGB(0xc8c7cc);
    [self.backgroundScrollView addSubview:lineView2];
    UIView *emailFieldBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(userTextFieldBackgroundView.frame), self.bounds.size.width, 45)];
    emailFieldBackgroundView.backgroundColor = [UIColor whiteColor];
    [self.backgroundScrollView addSubview:emailFieldBackgroundView];
    
    self.EmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(24, 0, self.bounds.size.width - 24, 45)];
    self.EmailTextField.backgroundColor = [UIColor whiteColor];
    self.EmailTextField.placeholder = @"邮箱";
    self.EmailTextField.returnKeyType = UIReturnKeyNext;
    self.EmailTextField.delegate = self;
    [emailFieldBackgroundView addSubview:self.EmailTextField];

    
//    // 密码
//    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(25, CGRectMake(0, CGRectGetMax(emailFieldBackgroundView.frame) - 1, self.bounds.size.width, 1)];
//    lineView3.backgroundColor = UIColorFromRGB(0xc8c7cc);
//    [self.backgroundScrollView addSubview:lineView3];
    
    UIView *passwordTextFieldBackgroundView  = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(emailFieldBackgroundView.frame), self.bounds.size.width, 45)];
    passwordTextFieldBackgroundView.backgroundColor = [UIColor whiteColor];
    [self.backgroundScrollView addSubview:passwordTextFieldBackgroundView];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(24, 0, self.bounds.size.width - 24, 45)];
    self.passwordTextField.backgroundColor = [UIColor whiteColor];
    self.passwordTextField.placeholder = @"密码";
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
    self.passwordTextField.delegate = self;
    [passwordTextFieldBackgroundView addSubview:self.passwordTextField];

    
    // 注册
    self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerButton.frame = CGRectMake(0, CGRectGetMaxY(passwordTextFieldBackgroundView.frame) + 35, 345, 45);
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.userTextField) {
        [self.EmailTextField becomeFirstResponder];
    } else if (textField == self.EmailTextField) {
        [self.passwordTextField becomeFirstResponder];
    } else if (textField == self.passwordTextField){
        if (self.block) {
            NSString *text = self.userTextField.text;
            NSString *email = self.EmailTextField.text;
            NSString *password = self.passwordTextField.text;
            self.block(text, email, password);
        }
    
    }
    
    
    return YES;
}
@end
