//
//  ZZQuestionDetailViewController.m
//  MIX
//
//  Created by zhou on 15/12/6.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZQuestionDetailViewController.h"
#import "ZZHttpClient.h"
#import "EXTScope.h"
#import "ZZQuestionDetailModel.h"
#import <RDVTabBarController/RDVTabBarController.h>
#import <RDVTabBarController/RDVTabBarItem.h>

@interface ZZQuestionDetailViewController ()
// 服务名部分数据
@property (nonatomic, copy) NSString *questionId;
@property (nonatomic, strong) UIWebView *contentWebView;
@end

@implementation ZZQuestionDetailViewController

- (instancetype)initWithQuestionId:(NSString *)questionId{
    self = [super init];
    if (self) {
        _questionId = questionId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    [self configureTitles:@"问题详情"];
    [self configureWebView];
    [self requestQuestionDetailWithQuestionId:self.questionId];

    
}


// 配置webview
- (void)configureWebView{
    self.contentWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    // 去白边
    for (id v in self.contentWebView.subviews) {
        if ([v isKindOfClass:[UIScrollView class]]) {
            [v setBounces:NO];
        }
    }
    [self.view addSubview:self.contentWebView];


}

- (void)requestQuestionDetailWithQuestionId:(NSString *)questionId{
    NSString *serviceName = [NSString stringWithFormat:@"question/%@",self.questionId];
    NSMutableDictionary  *parameters = [NSMutableDictionary dictionary];
    parameters[@"token"] = @"2b3aa3e88894040e148a7ad740185173";
    [self showLoading];
    @weakify(self);
    [[ZZHttpClient sharedHTTPClient] GET:serviceName parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        @strongify(self);
        [self hideLoading];
        
        ZZQuestionDetailModel *questionDetailModel = [[ZZQuestionDetailModel alloc] initWithDictionary:responseObject error:nil];
        if (questionDetailModel.status == 0) {
            [self handleQuestionDetailResponseSuccess:questionDetailModel];
        }else{
            [self handleQuestionDetailResponseFailure];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        @strongify(self);
        [self hideLoading];
        [self handleQuestionDetailResponseFailure];
    }];

}

// !!!后处理失败的情况
- (void)handleQuestionDetailResponseFailure{


}

// 处理成功的情况
- (void)handleQuestionDetailResponseSuccess:(ZZQuestionDetailModel *)questionDetailModel{
    ZZQuestionDetailDataModel *questionDetailModelData = questionDetailModel.data;
    [self refreshContentWebView:questionDetailModelData];
}

- (void)refreshContentWebView:(ZZQuestionDetailDataModel *)questionDetailModelData{
    [self.contentWebView loadHTMLString:questionDetailModelData.parsedText baseURL:nil];
}


@end
