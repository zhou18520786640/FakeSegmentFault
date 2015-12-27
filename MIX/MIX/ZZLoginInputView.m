
//
//  ZZLoginInputView.m
//  MIX
//
//  Created by zhou on 15/12/24.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZLoginInputView.h"
#import "MacroDefinition.h"

@interface ZZLoginInputView () <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *emailTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@end


@implementation ZZLoginInputView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubViews];
    }
    return self;
}



#pragma mark - private custom
- (void)configureSubViews{
    {  // 首行线
        CGRect rect = CGRectMake(0, 0, self.bounds.size.width, 1);
        UIView *topLineView = [[UIView alloc] initWithFrame:rect];
        topLineView.backgroundColor = UIColorFromRGB(0xdddddd);
        [self addSubview:topLineView];
    }
    

    self.emailTextField.frame = CGRectMake(10, 0, self.bounds.size.width - 20, 50);
    self.passwordTextField.frame = CGRectMake(10, CGRectGetMaxY(self.emailTextField.frame), self.bounds.size.width - 20, 50);
    
    {   // 中间线
        CGRect rect = CGRectMake(10, 50, self.bounds.size.width, 1);
        UIView *middleLineView = [[UIView alloc] initWithFrame:rect];
        middleLineView.backgroundColor = UIColorFromRGB(0xdddddd);
        [self addSubview:middleLineView];
    }
    

    
    
    {   // 尾行线
        CGRect rect = CGRectMake(0, 100, self.bounds.size.width, 1);
        UIView *bottomLineView = [[UIView alloc] initWithFrame:rect];
        bottomLineView.backgroundColor = UIColorFromRGB(0xdddddd);
        [self addSubview:bottomLineView];
    }
    
}



#pragma mark - setter and getter
- (NSString *)emailText{
    return self.emailTextField.text;
}

- (NSString *)passwordText{
    return self.passwordTextField.text;
}


- (UITextField *)emailTextField{
    if (_emailTextField == nil) {
        _emailTextField = [[UITextField alloc] init];
        _emailTextField.placeholder = @"Email";
        _emailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _emailTextField.returnKeyType = UIReturnKeyNext;
        _emailTextField.delegate = self;
        [self addSubview:_emailTextField];
    }
    return _emailTextField;
}


- (UITextField *)passwordTextField{
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"密码";
        _passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _passwordTextField.delegate = self;
        _passwordTextField.returnKeyType = UIReturnKeyDone;

        [self addSubview:_passwordTextField];
    }
    return _passwordTextField;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_emailTextField == textField) {
        [_passwordTextField becomeFirstResponder];
    }

    return YES;
}



@end
