//
//  ZZUser.m
//  MIX
//
//  Created by zhou on 15/12/24.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZUser.h"

@implementation ZZUser
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end


@implementation ZZUserData

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}


+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"userID"
                                                       }];
    
}


@end