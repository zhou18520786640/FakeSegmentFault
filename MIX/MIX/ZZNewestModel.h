//
//  ZZNewestModel.h
//  MIX
//
//  Created by zhou on 15/11/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@protocol ZZNewestRowItem @end

@interface ZZNewestRowItem : JSONModel
@property (nonatomic, copy) NSString *id ; //TODO:需要映射
/**
 *   跳转网址
 */
@property (nonatomic, copy) NSString *url;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title; //
/**
 *  投票数
 */
@property (nonatomic, copy) NSString *votes; //
/**
 *  创建时间
 */
@property (nonatomic, copy) NSString *created; //
/**
 *  创建日期
 */
@property (nonatomic, copy) NSString *createdDate; //
/**
 *  不知
 */
@property (nonatomic, copy) NSString *siteId; //
/**
 *  是否已被采纳
 */
@property (nonatomic, assign) BOOL isAccepted; //
/**
 *  多少人看过
 */
@property (nonatomic, copy) NSString *views; //
/**
 *  回答人数
 */
@property (nonatomic, copy) NSString *answers;
/**
 *  是否关闭
 */
@property (nonatomic, assign) BOOL isClosed;

@end



@interface ZZNewestPage : JSONModel
@property (nonatomic, assign) NSInteger current;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, assign) NSInteger next;
@end


@interface ZZNewestData : JSONModel
@property (nonatomic, strong) NSArray<ZZNewestRowItem> *rows;
@property (nonatomic, assign) ZZNewestPage *newestPage;
@end


@interface ZZNewestModel : JSONModel
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) ZZNewestData *data;
@property (nonatomic, copy) NSString *message;
@end
