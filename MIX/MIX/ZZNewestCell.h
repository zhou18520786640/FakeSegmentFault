//
//  NewestCell.h
//  MIX
//
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZNewestModel.h"


@interface ZZNewestCell : UITableViewCell

- (void)updateWithNewestModel:(ZZNewestModel *)newestModel;

@end
