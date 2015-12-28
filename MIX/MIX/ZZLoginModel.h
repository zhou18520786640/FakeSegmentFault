//
//  ZZLoginModel.h
//  MIX
//
//  Created by zhou on 15/12/28.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZBaseResponseModel.h"


@class ZZLoginMobileModel;
@interface ZZLoginModel : ZZBaseResponseModel
@property (nonatomic, strong) ZZLoginMobileModel<Optional> *mobile;
@end


@interface ZZLoginMobileModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *error_code;
@property (nonatomic, copy) NSString<Optional> *error;
@property (nonatomic, copy) NSString<Optional> *request;

@end