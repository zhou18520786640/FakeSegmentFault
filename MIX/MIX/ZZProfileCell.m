
//
//  ZZProfileCell.m
//  MIX
//
//  Created by zhou on 15/12/25.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZProfileCell.h"
#import "MacroDefinition.h"
#import "ZZRankView.h"
#import <FrameAccessor/FrameAccessor.h>

@interface ZZProfileCell ()
@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UIView *backgroundProfileView;
// 用户名，未登录且未注册时显示默认文案"登录/注册"
@property (nonatomic, strong) UILabel *userNameAndLoginTipLabel;
@property (nonatomic, strong) ZZRankView *rankView;
@end


@implementation ZZProfileCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = kMainColor;
    [self configureSubviews];
    return self;
}



- (void)configureSubviews{
    CGFloat  kWidth = [UIScreen mainScreen].bounds.size.width;

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 35, self.bounds.size.width, 216)];
    view.backgroundColor = [kMainColor colorWithAlphaComponent:0.5];
    [self.contentView addSubview:view];
    
    
    UIImage *image = [UIImage imageNamed:@"user_avatar"];
    _profileImageView = [[UIImageView alloc] initWithImage:image];
    _profileImageView.frame = CGRectMake(0,30, 60, 60);
    _profileImageView.userInteractionEnabled = YES;
    _profileImageView.center = CGPointMake(kWidth * 0.5, _profileImageView.center.y);
    [self.contentView addSubview:_profileImageView];
    
    CGRect rect = CGRectMake(0, CGRectGetMaxY(_profileImageView.frame) + 20, kWidth, 17);
    _userNameAndLoginTipLabel = [[UILabel alloc] initWithFrame:rect];
    _userNameAndLoginTipLabel.text = @"登录/注册";
    _userNameAndLoginTipLabel.textColor = [UIColor whiteColor];
    _userNameAndLoginTipLabel.font = [UIFont systemFontOfSize:17];
    _userNameAndLoginTipLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_userNameAndLoginTipLabel];
    

    
    _rankView = [[ZZRankView alloc] initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 65)];
    [self.contentView addSubview:_rankView];
    


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateLikeCount:(NSString *)like
             honorCount:(NSString *)honor
        reputationCount:(NSString *)reputation {
    [self.rankView updateLikeCount:like honorCount:honor reputationCount:reputation];
}

- (void)updateName:(NSString *)userName {
    self.userNameAndLoginTipLabel.text = userName;

}


@end
