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
#import "ZZBrowerViewController.h"

@interface ZZQuestionDetailViewController ()<UIWebViewDelegate>
// 服务名部分数据
@property (nonatomic, copy) NSString *questionId;
@property (nonatomic, strong) UIWebView *contentWebView;

@property (nonatomic, copy) NSString *parsedText;
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
    self.contentWebView.delegate = self;
    // 去白边
//    self.contentWebView.backgroundColor = [UIColor redColor];
//    for (id v in self.contentWebView.subviews) {
//        if ([v isKindOfClass:[UIScrollView class]]) {
//            UIScrollView *scrollView = (UIScrollView *)v;
//            scrollView.showsVerticalScrollIndicator = YES;
//            [v setBounces:NO];
//            
//        }
//    }
    

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

// 刷新webview
- (void)refreshContentWebView:(ZZQuestionDetailDataModel *)questionDetailModelData{
    
    
    NSString *parseTitle = [NSString stringWithFormat:@"<h3>%@</h3>",questionDetailModelData.title];
    NSString *parseNameAndRank = [NSString stringWithFormat:@"<h4 id = \"time\"><span>%@ %@</span> · %@</h4>",questionDetailModelData.user.name,questionDetailModelData.user.rank,questionDetailModelData.createdDate];
    NSString *HTMLString = [NSString stringWithFormat:@"%@%@%@",parseTitle,parseNameAndRank,questionDetailModelData.parsedText];
    
    
    
    
    NSMutableString *tagHTML = [[NSMutableString alloc] init];
    for (NSUInteger i = 0; i < questionDetailModelData.tags.count; i++) {
        ZZQuestionDetailTagModel *tag = questionDetailModelData.tags[i];
        NSString *name = tag.name;
        if (i == 0) {
            [tagHTML appendString:@"<p class = \"tag\" >"];
        }
            [tagHTML appendString:name];
            [tagHTML appendString:@" "];
        if (i == questionDetailModelData.tags.count - 1) {
            [tagHTML appendString:@"</p>"];
        }
    }
    
    HTMLString = [NSString stringWithFormat:@"%@%@",HTMLString, tagHTML];
    
    
    HTMLString = [NSString stringWithFormat:@"%@<hr />",HTMLString];
    
    
    
    self.parsedText = questionDetailModelData.parsedText;
    
    // 链接mainBundle中的CSS文件
    NSURL *cssURL = [[NSBundle mainBundle] URLForResource:@"questionDetail" withExtension:@"css"];
    HTMLString = [NSString stringWithFormat:@"<link rel=\"stylesheet\" href=\"%@\">%@",cssURL,HTMLString];
    [self.contentWebView loadHTMLString:HTMLString baseURL:nil];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{


    // 层层递进的三个条件
    // 1.是contentWebView
    // 2.是点击事件
    // 3.是属于问题那里的链接
    if (webView == self.contentWebView ) {
        if (navigationType == UIWebViewNavigationTypeLinkClicked) {
            if ([self.parsedText containsString:request.URL.absoluteString]) {
                ZZBrowerViewController *webViewController = [[ZZBrowerViewController alloc] initWithRequest:request];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:webViewController];
                [self presentViewController:navigationController animated:YES completion:nil];
             
                return NO;
            }
        }
    }

    
    return YES;
}

@end
