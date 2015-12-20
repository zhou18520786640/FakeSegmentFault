//
//  ZZWebViewController.m
//  MIX
//
//  Created by zhou on 15/12/21.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZBrowerViewController.h"

@interface ZZBrowerViewController ()
@property (nonatomic, strong) NSURLRequest *request;
@property (nonatomic, strong) UIWebView *contentWebView;
@end

@implementation ZZBrowerViewController

- (instancetype)initWithRequest:(NSURLRequest *)URLRequest{
    self = [self init];
    if (self) {
        self.request = URLRequest;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureWebView];
    
    
    [self.contentWebView loadRequest:self.request];
}

- (void)configureWebView {
    self.contentWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    self.contentWebView.delegate = self;
    // 去白边
    self.contentWebView.backgroundColor = [UIColor redColor];
    for (id v in self.contentWebView.subviews) {
        if ([v isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)v;
            scrollView.showsVerticalScrollIndicator = NO;
            //            [v setBounces:NO];
            
        }
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
