//
//  ZZNewestListModel.h
//  MIX
//  
//  Created by zhou on 15/12/5.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZZBaseResponseModel.h"



@class ZZNewestListDataModel;

@interface ZZNewestListModel : ZZBaseResponseModel
@property (nonatomic, strong) ZZNewestListDataModel *data;
@end


