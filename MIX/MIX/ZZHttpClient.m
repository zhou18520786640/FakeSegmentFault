//
//  ZZHttpClient.m
//  MIX
//
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZHttpClient.h"
#import "MBProgressHUD.h"

// 使用一个静态类来封装
static MBProgressHUD *loadingHud = nil;

static NSString * const kBaseURL = @"http://api.segmentfault.com";


@implementation ZZHttpClient
+ (ZZHttpClient *)sharedHTTPClient
{
    static ZZHttpClient *_HTTPClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _HTTPClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    });
    return _HTTPClient;
}


#pragma mark - private 
- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        [self.requestSerializer setTimeoutInterval:15];

        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

#pragma mark - profile
- (void)requestUserProfileWithSuccessBlock:(SuccessBlock *)success failBlock:(FailBlock)fail{
    NSMutableDictionary  *parameters = [NSMutableDictionary dictionary];
    parameters[@"token"] = @"2b3aa3e88894040e148a7ad740185173";
    
    [self GET:@"/user/me" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
//        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        fail(error);
    }];

}

- (void)requestLoginWithWithSuccessBlock:(SuccessBlock *)success failBlock:(FailBlock)fail{
//    NSMutableDictionary *

}







@end
