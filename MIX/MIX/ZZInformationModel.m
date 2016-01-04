//
//  ZZInformationModel.m
//  MIX
//
//  Created by zhou on 16/1/4.
//  Copyright © 2016年 jeff.zhou. All rights reserved.
//

#import "ZZInformationModel.h"

@implementation ZZInformationModel

@end

@implementation ZZInformationDataModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description":@"inforamtionDescription",
                                                       @"id":@"inforamtionID"
                                                       }];
}
@end
