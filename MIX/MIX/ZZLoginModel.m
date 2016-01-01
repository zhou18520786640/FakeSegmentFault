//
//  ZZLoginModel.m
//  MIX
//
//  Created by zhou on 15/12/28.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZLoginModel.h"

@implementation ZZLoginModel
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end

@implementation ZZLoginMobileModel
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end


@implementation ZZLoginUserModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"userID",
                                                       }];
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end

