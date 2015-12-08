//
//  ZZAskViewController.m
//  MIX
//  提问页面
//  Created by zhou on 15/12/5.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZAskViewController.h"

@interface ZZAskViewController ()

@end

@implementation ZZAskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTitles:@"提问"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setTitle:@"关闭" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [button addTarget:self action:@selector(buttonDidPressed) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonDidPressed{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
