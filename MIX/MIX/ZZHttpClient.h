//
//  ZZNetworkManager.h
//  MIX
//
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void (^SuccessBlock)(id data);
typedef void (^FailBlock)(id data);

@interface ZZHttpClient : AFHTTPSessionManager
+ (ZZHttpClient *)sharedHTTPClient;



#pragma mark - 个人中心

#pragma mark - 个人中心数据
- (void)requestUserProfileWithSuccessBlock:(SuccessBlock)success failBlock:(FailBlock)fail;
#pragma mark - 登录
- (void)requestLoginWithName:(NSString *)name password:(NSString *)password SuccessBlock:(SuccessBlock)success failBlock:(FailBlock)fail;

@end
