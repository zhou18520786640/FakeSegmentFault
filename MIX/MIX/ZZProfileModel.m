
//
//  ZZProfileModel.m
//  MIX
//
//  Created by zhou on 16/1/3.
//  Copyright © 2016年 jeff.zhou. All rights reserved.
//

#import "ZZProfileModel.h"

@implementation ZZProfileModel

@end


@implementation ZZProfileDataModel

+ (JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"profileID",
                                                       }];
}

@end