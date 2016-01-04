//
//  ZZInformationModel.h
//  MIX
//
//  Created by zhou on 16/1/4.
//  Copyright © 2016年 jeff.zhou. All rights reserved.
//

#import "ZZBaseResponseModel.h"
@class ZZInformationDataModel;
@interface ZZInformationModel : ZZBaseResponseModel
@property (nonatomic, strong) ZZInformationDataModel *data;
@end


@interface ZZInformationDataModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *address;
@property (nonatomic, copy) NSString<Optional> *avatarUrl;
@property (nonatomic, copy) NSString<Optional> *birthday;
@property (nonatomic, copy) NSString<Optional> *cityName;
@property (nonatomic, copy) NSString<Optional> *inforamtionDescription;
@property (nonatomic, copy) NSString<Optional> *gender;
@property (nonatomic, copy) NSString<Optional> *homepage;
@property (nonatomic, copy) NSString<Optional> *inforamtionID; // key maaper id
@property (nonatomic, copy) NSString<Optional> *latestEducation;
@property (nonatomic, copy) NSString<Optional> *latestEmployment;
@property (nonatomic, copy) NSString<Optional> *name;
@property (nonatomic, copy) NSString<Optional> *parsedText;
@property (nonatomic, copy) NSString<Optional> *rank;
@property (nonatomic, copy) NSString<Optional> *slug;
@property (nonatomic, copy) NSString<Optional> *url;

@end