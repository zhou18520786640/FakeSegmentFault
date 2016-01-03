//
//  ZZProfileModel.h
//  MIX
//
//  Created by zhou on 16/1/3.
//  Copyright © 2016年 jeff.zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZBaseResponseModel.h"


@class ZZProfileDataModel;

@interface ZZProfileModel : ZZBaseResponseModel
@property (nonatomic, strong) ZZProfileDataModel<Optional> *data;
@end

@interface ZZProfileDataModel : JSONModel
/**
 *  回答数
 */
@property (nonatomic, copy) NSString<Optional> *answers;
@property (nonatomic, copy) NSString<Optional> *articles;
@property (nonatomic, copy) NSString<Optional> *avatarUrl;
/**
 *  徽章
 */
@property (nonatomic, copy) NSString<Optional> *badges;
@property (nonatomic, copy) NSString<Optional> *profileID; // key mapper id
@property (nonatomic, copy) NSString<Optional> *isEachFollowed;
@property (nonatomic, copy) NSString<Optional> *isFollowed;
@property (nonatomic, copy) NSString<Optional> *likedVotes;
@property (nonatomic, copy) NSString<Optional> *name;
@property (nonatomic, copy) NSString<Optional> *questions;
@property (nonatomic, copy) NSString<Optional> *rank;
@property (nonatomic, copy) NSString<Optional> *slug;
@property (nonatomic, copy) NSString<Optional> *url;
@end