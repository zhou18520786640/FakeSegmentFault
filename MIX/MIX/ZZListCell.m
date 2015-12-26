//
//  ZZListCell.m
//  MIX
//
//  Created by zhou on 15/12/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZListCell.h"

@interface ZZListCell ()
@property (nonatomic, strong) UILabel *numLabel;
@end

@implementation ZZListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self configureSubViews];
    return self;
}


- (void)configureSubViews {
    CGRect rect = CGRectMake(330, 0, 18, self.bounds.size.height);
    self.numLabel = [[UILabel alloc] initWithFrame:rect];
    self.numLabel.backgroundColor = [UIColor clearColor];
}

- (void)configureNumber:(NSString *)number {
    self.numLabel.text = number;
}

@end
