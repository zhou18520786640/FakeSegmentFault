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



#pragma mark  个人中心
- (void)requestUserProfileWithSuccessBlock:(SuccessBlock *)success failBlock:(FailBlock)faile;


@end
