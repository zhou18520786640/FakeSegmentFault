//
//  NewestCell.m
//  MIX
//
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZNewestCell.h"
#import "ZZNewestVoteView.h"
#import "MacroDefinition.h"
@interface ZZNewestCell ()
/**
 *  /
 */
@property (nonatomic, strong) UILabel *userAndTimeLabel; // 提问人回答问题的人的回答时间

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) ZZNewestVoteView *voteView;

@property (nonatomic, strong) UIView *lineView;
@end


@implementation ZZNewestCell

- (void)awakeFromNib {
    // Initialization code
}



- (void)updateWithNewestModel:(ZZNewestListItemModel *)newestListItem{
    NSString *user = newestListItem.user.name;
    NSString *answerTime = newestListItem.lastAnswer.createdDate;
    // TODO:改变｜为中心小圆点
    NSString *text;
    if (answerTime.length > 0) {
       text = [NSString stringWithFormat:@"%@ · %@",user,answerTime];
    }else{
       text = [NSString stringWithFormat:@"%@ · 刚刚",user];
    }
    
    NSString *title = newestListItem.title;
    
    [self layoutWithTitle:title Text:text vote:nil];
}


- (void)layoutWithTitle:(NSString *)title Text:(NSString *)text vote:(NSString *)vote{
    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = 61;
    self.userAndTimeLabel.frame = CGRectMake(x, 19, viewWidth - 61, 13);
    self.userAndTimeLabel.text = text;
    
    CGFloat titleLabelY = CGRectGetMaxY(self.userAndTimeLabel.frame) + 10;
    self.titleLabel.frame = CGRectMake(x, titleLabelY, viewWidth - x - 20, 0);
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.text =title;
    [self.titleLabel sizeToFit];
    
    self.contentView.frame = CGRectMake(0, 0, viewWidth, CGRectGetMaxY(self.titleLabel.frame) + 14);
    self.frame = CGRectMake(0, 0, viewWidth, CGRectGetMaxY(self.titleLabel.frame) + 14);
    self.lineView.frame = CGRectMake(15, self.bounds.size.height - 1, viewWidth - 15, 1);

}


- (UILabel *)userAndTimeLabel{
    if (_userAndTimeLabel == nil) {
        _userAndTimeLabel = [[UILabel alloc] init];
        _userAndTimeLabel.backgroundColor = [UIColor clearColor];
        _userAndTimeLabel.textColor = UIColorFromRGB(0x999999);
        _userAndTimeLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_userAndTimeLabel];
    }
    return _userAndTimeLabel;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (ZZNewestVoteView *)voteView{
    if (_voteView == nil) {
        _voteView = [ZZNewestVoteView voteView];
        [self.contentView addSubview:_voteView];
    }
    return _voteView;

}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = UIColorFromRGB(0xc8c7cc);
        [self.contentView addSubview:_lineView];
    }
    return _lineView;
}
@end
