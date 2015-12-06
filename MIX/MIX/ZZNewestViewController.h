//
//  ZZNewestViewController.h
//  MIX
//
//  Created by zhou on 15/11/25.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZViewController.h"

@protocol ZZNewestViewControllerDelegate;

@interface ZZNewestViewController : ZZViewController
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id<ZZNewestViewControllerDelegate> delegate;

@end


@protocol ZZNewestViewControllerDelegate <NSObject>

- (void)newestViewController:(ZZNewestViewController *)newestViewController
    didPressedWithQuestionId:(NSString *)questionid;

@end