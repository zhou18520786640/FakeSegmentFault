//
//  ZZNetworkManager.h
//  MIX
//
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface ZZHttpClient : AFHTTPSessionManager
+ (ZZHttpClient *)sharedHTTPClient;

@end
