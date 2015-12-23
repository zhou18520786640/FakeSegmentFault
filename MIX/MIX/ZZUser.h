//
//  ZZUser.h
//  MIX
//
//  Created by zhou on 15/12/24.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZZBaseResponseModel.h"
@class ZZUserData;
@interface ZZUser : ZZBaseResponseModel
@property (nonatomic, strong) ZZUserData *data;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *msg;
@end


@interface ZZUserData : JSONModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *mail;
@property (nonatomic, copy) NSString *useID; // mapper: id->useID
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *rank;
@property (nonatomic, copy) NSString *avatarUrl;
@end