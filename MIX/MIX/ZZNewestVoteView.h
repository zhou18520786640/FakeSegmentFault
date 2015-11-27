//
//  ZZNewest.h
//  MIX
//
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZNewestVoteView : UIView
+ (ZZNewestVoteView *)voteView;
- (void)updateWithReviews:(NSString *)reviews
               unAnwsered:(BOOL)unAnwsered
               isAccepted:(BOOL)isAccepted;
@end
