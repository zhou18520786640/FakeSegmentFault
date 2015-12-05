//
//  NewestCell.m
//  MIX
//
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZNewestCell.h"
#import "ZZNewestVoteView.h"
@interface ZZNewestCell ()
/**
 *  /
 */
@property (nonatomic, strong) UILabel *userAndTimeLabel;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) ZZNewestVoteView *voteView;
@end


@implementation ZZNewestCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (void)updateWithNewestModel:(ZZNewestListItemModel *)newestModel{
//    
//
//}

@end
