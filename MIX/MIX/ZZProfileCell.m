
//
//  ZZProfileCell.m
//  MIX
//
//  Created by zhou on 15/12/25.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZProfileCell.h"
#import "MacroDefinition.h"


@interface ZZProfileCell ()
@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UIView *backgroundProfileView;
@property (nonatomic, strong) UIView *rankView;

@end


@implementation ZZProfileCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = kMainColor;
    [self configureSubviews];
    return self;
}



- (void)configureSubviews{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.width - 65, self.bounds.size.width, 65)];
    view.backgroundColor = [kMainColor colorWithAlphaComponent:0.5];
    [self.contentView addSubview:view];
    
    


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
