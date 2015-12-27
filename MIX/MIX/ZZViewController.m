//
//  ZZViewController.m
//  MIX
//
//  Created by zhou on 15/12/5.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZViewController.h"
#import "MBProgressHUD.h"

// 使用一个静态类来封装
static MBProgressHUD *loadingHud = nil;

@interface ZZViewController ()
@end

@implementation ZZViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}


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

- (void)showLoading {
    if (!loadingHud) {
        loadingHud = [[MBProgressHUD alloc] initWithView:self.view];
        loadingHud.mode = MBProgressHUDModeIndeterminate;
    }
    
    loadingHud.removeFromSuperViewOnHide = YES;
    [self.view addSubview:loadingHud];
    [loadingHud show:YES];
}

- (void)hideLoading {
    [loadingHud hide:YES];
    loadingHud = nil;
}


- (void)configureTitles:(NSString *)titles{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 36, 18)];
    titleLabel.text = titles;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titleLabel;
}

- (void)configureLeftBackButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 20, 20);
    UIImage *image = [UIImage imageNamed:@"icon_btn_back"];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)backButtonDidPressed:(UIButton *)button {
    [self.navigationController popToRootViewControllerAnimated:YES];

}


@end
