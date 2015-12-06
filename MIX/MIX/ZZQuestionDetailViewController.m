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

@interface ZZQuestionDetailViewController ()
// 服务名部分数据
@property (nonatomic, copy) NSString *questionId;
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
    [self configureTitles:@"问题详情"];
    
    NSString *serviceName = [NSString stringWithFormat:@"question/%@",self.questionId];
    
    NSMutableDictionary  *parameters = [NSMutableDictionary dictionary];

    @weakify(self);
    parameters[@"token"] = @"2b3aa3e88894040e148a7ad740185173";
    
    [[ZZHttpClient sharedHTTPClient] GET:serviceName parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        @strongify(self);
        ZZQuestionDetailModel *questionDetailModel = [[ZZQuestionDetailModel alloc] initWithDictionary:responseObject error:nil];
        if (questionDetailModel.status == 0) {
            
        }else{
            [self handleQuestionDetailResponseFailure];
        }
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        @strongify(self);
        [self handleQuestionDetailResponseFailure];
    }];
    
}


- (void)handleQuestionDetailResponseFailure{


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
