//
//  ZZViewController.m
//  MIX
//
//  Created by zhou on 15/12/5.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZViewController.h"
#import "MBProgressHUD.h"


@interface ZZViewController ()
@end

@implementation ZZViewController



- (void)showText:(NSString*)str{
    if ([str length] > 0) {
        UIView *view = [[UIApplication sharedApplication].delegate window];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        
        hud.removeFromSuperViewOnHide = YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = str;
        [view addSubview:hud];
        
        [hud show:YES];
        [hud hide:YES afterDelay:1.5];
    }
    
}


- (void)configureTitles:(NSString *)titles{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 36, 18)];
    titleLabel.text = titles;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titleLabel;
}


@end
