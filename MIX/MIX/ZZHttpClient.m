//
//  ZZHttpClient.m
//  MIX
//
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZHttpClient.h"

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


@end
