//
//  ZZBaseResponseModel.h
//  MIX
//
//  Created by zhou on 15/12/5.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ZZBaseResponseModel : JSONModel
/**
 *  状态码：定义为0成功
 */
@property (nonatomic, assign) NSInteger status;
/**
 *  消息
 */
@property (nonatomic, copy) NSString *message;
@end
