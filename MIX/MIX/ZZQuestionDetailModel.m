//
//  ZZQuestionDetailModel.m
//  MIX
//
//  Created by zhou on 15/12/6.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZQuestionDetailModel.h"

@implementation ZZQuestionDetailModel

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}


@end

@implementation ZZQuestionDetailDataModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"questionDetailID"
                                                       }];
    
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}


@end


@implementation ZZQuestionDetailLastAnswerModel
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}



@end

@implementation ZZQuestionDetailLastAnswerUserModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"lastAnswerUserId"
                                                       }];
    
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}



@end


@implementation ZZQuestionDetailTagModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"tagId"
                                                       }];
    
}


+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end

@implementation ZZQuestionDetailUserModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"questionDetailUserId"
                                                       }];
    
}


+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}


@end

@implementation ZZQuestionDetailTagSimilarTagModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"similarTagsId",
                                                       @"name": @"similarTagsName"}];
    
}



+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end