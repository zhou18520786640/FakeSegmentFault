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

// 超过三个的数组封装陈成一个dictionary

#pragma mark - 个人中心


#pragma mark - 登录
- (void)requestLoginWithName:(NSString *)name password:(NSString *)password SuccessBlock:(SuccessBlock)success failBlock:(FailBlock)fail;

#pragma mark - 个人用户信息
- (void)requestUserProfileWithSuccessBlock:(SuccessBlock)succces failBlock:(FailBlock)fail;

#pragma mark - 注册
- (void)requestRegisterWithName:(NSString *)name
                  email:(NSString *)email
               password:(NSString *)password
           SuccessBlock:(SuccessBlock)success
              failBlock:(FailBlock)fail;
#pragma mark - 个人资料
- (void)requestMeWithSuccessBlock:(SuccessBlock)succces failBlock:(FailBlock)fail;

@end

