//
//  ZZLoginThirdPartyView.m
//  MIX
//
//  Created by zhou on 16/1/2.
//  Copyright © 2016年 jeff.zhou. All rights reserved.
//

#import "ZZLoginThirdPartyView.h"
#import <FrameAccessor/FrameAccessor.h>

@interface ZZLoginThirdPartyView ()
@property (nonatomic, strong) UIButton *googleButton;
@property (nonatomic, strong) UIButton *sinaButton;
@property (nonatomic, strong) UIButton *githubButton;
@property (nonatomic, strong) UIButton *QQButton;
@property (nonatomic, strong) UIButton *weChatButton;

@property (nonatomic, copy) ZZLoginThirdPartyViewBlock block;

@end

@implementation ZZLoginThirdPartyView
- (instancetype)initWithFrame:(CGRect)frame thirdPartyIconDidPressedblock:(ZZLoginThirdPartyViewBlock)block {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubViewsAndLayoutFrame];
        self.block = block;
    }
    return self;
}

- (void)configureSubViewsAndLayoutFrame {
    self.googleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.googleButton.frame = CGRectMake(0, 0, 48, 48);
    [self.googleButton setImage:[UIImage imageNamed:@"sns_icon_14"] forState:UIControlStateNormal];
    [self.googleButton addTarget:self action:@selector(buttonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.googleButton];
    
    self.sinaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sinaButton.frame = CGRectMake(self.googleButton.right + 12, 0, 48, 48);
    [self.sinaButton setImage:[UIImage imageNamed:@"sns_icon_1"] forState:UIControlStateNormal];
    [self.sinaButton addTarget:self action:@selector(buttonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.sinaButton];
    
    
    self.githubButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.githubButton.frame = CGRectMake(self.sinaButton.right + 12, 0, 48, 48);
    [self.githubButton setImage:[UIImage imageNamed:@"icon_github"] forState:UIControlStateNormal];
    
    [self.githubButton addTarget:self action:@selector(buttonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.githubButton];
    
    self.QQButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.QQButton.frame = CGRectMake(self.githubButton.right + 12, 0, 48, 48);
    [self.QQButton setImage:[UIImage imageNamed:@"sns_icon_24"] forState:UIControlStateNormal];
    [self.QQButton addTarget:self action:@selector(buttonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.QQButton];
    
    self.weChatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.weChatButton.frame = CGRectMake(self.QQButton.right + 12, 0, 48, 48);
    [self.weChatButton setImage:[UIImage imageNamed:@"sns_icon_19"] forState:UIControlStateNormal];
    [self.weChatButton addTarget:self action:@selector(buttonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.weChatButton];

    
    // weChatButton是最后一个按钮
    self.viewSize = CGSizeMake(self.weChatButton.right, 48);
    

}

- (void)buttonDidPressed:(UIButton *)button {
    if (!self.block) {
        return;
    }
    if (button == self.googleButton) {
        self.block(ZZLoginThirdPartyViewTypeGoogle);
    } else if (button == self.sinaButton) {
        self.block(ZZLoginThirdPartyViewTypeSina);
    } else if (button == self.githubButton) {
        self.block(ZZLoginThirdPartyViewTypeGithub);
    } else if (button == self.QQButton) {
        self.block(ZZLoginThirdPartyViewTypeQQ);
    } else if (button == self.weChatButton) {
        self.block(ZZLoginThirdPartyViewTypeWeChat);
    }
}

@end
