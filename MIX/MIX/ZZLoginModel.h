//
//  ZZLoginModel.h
//  MIX
//
//  Created by zhou on 15/12/28.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZBaseResponseModel.h"


@class ZZLoginMobileModel;
@class ZZLoginUserModel;
@class ZZLoginDataModel;
@interface ZZLoginModel : ZZBaseResponseModel
@property (nonatomic, strong) ZZLoginDataModel *data;
@end

@interface ZZLoginDataModel : JSONModel
@property (nonatomic, strong) ZZLoginMobileModel *mobile;
@property (nonatomic, strong) ZZLoginUserModel *user;
@property (nonatomic, copy) NSString *token;
@end


@interface ZZLoginMobileModel : JSONModel
@property (nonatomic, copy) NSString *error_code;
@property (nonatomic, copy) NSString *error;
@property (nonatomic, copy) NSString *request;
@end

@interface ZZLoginUserModel : JSONModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *mail;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *rank;
@property (nonatomic, copy) NSString *avatarUrl;

@end