



//
//  ZZConfiguration.m
//  MIX
//
//  Created by zhou on 15/12/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZConfiguration.h"

@implementation ZZConfiguration

+ (instancetype)sharedConfigration {
    static ZZConfiguration *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ZZConfiguration alloc] init];
    });
    
    return _sharedClient;
}
@end
