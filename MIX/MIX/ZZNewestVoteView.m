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
    voteView.layer.cornerRadius = 2;
    
    voteView.voteNumberLabel = [[UILabel alloc] init];
    return voteView;
}

- (void)updateWithReviews:(NSString *)reviews unAnwsered:(BOOL)unAnwsered isAccepted:(BOOL)isAccepted{
    
    // 投票数目
    self.voteStatusLabel.text = reviews;
    
    
    //****设置背景色和状态****
    if (isAccepted) { // 被采纳
        self.backgroundColor = UIColorFromRGB(0x808b87);
        self.voteStatusLabel.text = @"解决";
        
    }else{
        if (unAnwsered) { // 不被采纳且无人回答
            self.backgroundColor = UIColorFromRGB(0xaf3933);
        }else{ // // 不被采纳但有人回答
            self.backgroundColor = UIColorFromRGB(0x009a61);
        }
        self.voteStatusLabel.text = @"回答";
    }


    
    
}


@end
