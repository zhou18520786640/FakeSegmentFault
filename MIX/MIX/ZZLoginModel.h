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
@interface ZZLoginModel : ZZBaseResponseModel
@property (nonatomic, strong) ZZLoginMobileModel<Optional> *mobile;
@property (nonatomic, strong) ZZLoginUserModel<Optional> *user;
@property (nonatomic, copy) NSString<Optional> *token;
@end


@interface ZZLoginMobileModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *error_code;
@property (nonatomic, copy) NSString<Optional> *error;
@property (nonatomic, copy) NSString<Optional> *request;
@end

@interface ZZLoginUserModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *name;
@property (nonatomic, copy) NSString<Optional> *mail;
@property (nonatomic, copy) NSString<Optional> *slug;
@property (nonatomic, copy) NSString<Optional> *userID;
@property (nonatomic, copy) NSString<Optional> *url;
@property (nonatomic, copy) NSString<Optional> *rank;
@property (nonatomic, copy) NSString<Optional> *avatarUrl;

@end