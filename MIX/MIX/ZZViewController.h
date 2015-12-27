//
//  ZZViewController.h
//  MIX
//
//  Created by zhou on 15/12/5.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZViewController : UIViewController
/**
 *  封装方法供子类使用
 *
 *  @param str 显示文案
 */
- (void)showText:(NSString*)str;

/**
 *  显示loading
 */
- (void)showLoading;

/**
 *  隐藏loading
 */
- (void)hideLoading;
/**
 *  设置titleView,封装方法供子类使用
 *
 *  @param titles 标题
 */
- (void)configureTitles:(NSString *)titles;
/**
 *  返回按钮被按下时回调
 *
 *  @param button 返回按钮
 */
- (void)configureLeftBackButton;


@end
