//
//  ZZNewestListItem.h
//  MIX
//


//  Created by zhou on 15/12/5.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@class ZZNewestListItemModel;
@protocol ZZNewestListItemModel;
@class ZZNewestListPageModel;

@interface ZZNewestListDataModel : JSONModel

@property (strong, nonatomic) NSArray<ZZNewestListItemModel>* items; // mapper rows
@property (nonatomic, strong) ZZNewestListPageModel *page;
@end

// -------------------------------------------------------------------

@class ZZNewestListItemLastAnswerModel;
@class ZZNewestListItemUserModel;

@protocol ZZNewestListItemModel @end;
@interface ZZNewestListItemModel : JSONModel
@property (nonatomic, copy) NSString *newestListItemID; // mapper id
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *votes;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, copy) NSString *siteId;
@property (nonatomic, assign) BOOL isAccepted;
@property (nonatomic, copy) NSString *views;
@property (nonatomic, copy) NSString *answers;
@property (nonatomic, assign) BOOL isClosed;
@property (nonatomic, strong) ZZNewestListItemLastAnswerModel *lastAnswer;
@property (nonatomic, strong) ZZNewestListItemUserModel *user;
@end
// -------------------------------------------------------------------
@class ZZNewestListItemLastAnswerUser;

@interface ZZNewestListItemLastAnswerModel : JSONModel
@property (nonatomic, copy) ZZNewestListItemLastAnswerUser *user;
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, copy) NSString *url;
@end
// -------------------------------------------------------------------

@interface ZZNewestListItemLastAnswerUser : JSONModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *newestListItemLastAnswerUserID; //mapper id

@end

// -------------------------------------------------------------------

@interface ZZNewestListItemUserModel : JSONModel
@property (nonatomic, copy) NSString *newestListItemUserID; // mapper id
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *rank;
@property (nonatomic, copy) NSString *avatarUrl;
@property (nonatomic, copy) NSString *url;

@end

// -------------------------------------------------------------------

@interface ZZNewestListPageModel : JSONModel
@property (nonatomic, assign) NSInteger current;
@property (nonatomic, assign) NSInteger next;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, assign) NSInteger total;
@end





