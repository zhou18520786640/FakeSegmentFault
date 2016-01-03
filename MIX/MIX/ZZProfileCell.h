//
//  ZZProfileCell.h
//  MIX
//
//  Created by zhou on 15/12/25.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZProfileCell : UITableViewCell
- (void)updateLikeCount:(NSString *)like
             honorCount:(NSString *)honor
        reputationCount:(NSString *)reputation;
- (void)updateName:(NSString *)userName;
@end
