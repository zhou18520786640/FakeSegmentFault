//
//  ZZNewest.m
//  MIX
//  54 * 60  ---27 * 30
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZNewestVoteView.h"
#import "MacroDefinition.h"

@interface ZZNewestVoteView ()
/**
 *  投票数目
 */
@property (nonatomic, strong) UILabel *voteNumberLabel;
/**
 *  有两种状态文案，回答或者解决
 */
@property (nonatomic, strong) UILabel *voteStatusLabel;
@end



@implementation ZZNewestVoteView

+ (ZZNewestVoteView *)voteView{
    ZZNewestVoteView *voteView = [[ZZNewestVoteView alloc] init];
    voteView.backgroundColor = [UIColor clearColor];
    voteView.layer.cornerRadius = 3;
    
    return voteView;
}

- (void)updateWithReviews:(NSString *)reviews
                 Anwsered:(NSString *)Anwsered
               isAccepted:(BOOL)isAccepted{
    
    // 投票数目
    self.voteNumberLabel.text = Anwsered;
    
    
    //****设置背景色和状态****
    if (isAccepted) { // 被采纳
        self.backgroundColor = UIColorFromRGB(0x808b87);
        self.voteStatusLabel.text = @"解决";
        
    }else{
        if ([Anwsered integerValue] == 0) { // 不被采纳且无人回答
            self.backgroundColor = UIColorFromRGB(0xaf3933);
        }else{ // // 不被采纳但有人回答
            self.backgroundColor = UIColorFromRGB(0x009a61);
        }
        self.voteStatusLabel.text = @"回答";
    }
}


- (UILabel *)voteNumberLabel{
    if (_voteNumberLabel == nil) {
        _voteNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 7, self.bounds.size.width, 14)];
        _voteNumberLabel.center = CGPointMake(self.bounds.size.width * 0.5, _voteNumberLabel.center.y);
        _voteNumberLabel.textColor = [UIColor whiteColor];
        _voteNumberLabel.font = [UIFont systemFontOfSize:14];
        _voteNumberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_voteNumberLabel];
    }
    return _voteNumberLabel;

}

- (UILabel *)voteStatusLabel{
    if (_voteStatusLabel == nil) {
        _voteStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 24, self.bounds.size.width, 12)];
        _voteStatusLabel.backgroundColor = [UIColor clearColor];
        _voteStatusLabel.font = [UIFont systemFontOfSize:12];
        _voteStatusLabel.textColor = [UIColor whiteColor];
        _voteStatusLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_voteStatusLabel];
    }
    return _voteStatusLabel;
}

@end
