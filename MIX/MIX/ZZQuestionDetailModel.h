//
//  ZZQuestionDetailModel.h
//  MIX
//
//  Created by zhou on 15/12/6.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZBaseResponseModel.h"

// 层次关系
// ZZQuestionDetailModel [1]
// ----ZZQuestionDetailLastAnswerModel [2]
// --------ZZQuestionDetailLastAnswerUserModel [3]
// ----NSArray<ZZQuestionDetailTagModel> [2]
// ----ZZQuestionDetailUserModel [2]





@class ZZQuestionDetailLastAnswerModel;
@protocol ZZQuestionDetailTagModel;
@class ZZQuestionDetailUserModel;




@class ZZQuestionDetailDataModel;

@interface ZZQuestionDetailModel : ZZBaseResponseModel

@property (nonatomic, strong) ZZQuestionDetailDataModel *data;

@end



@interface ZZQuestionDetailDataModel : JSONModel
/**
 *  问题详情ID
 */
@property (nonatomic, copy) NSString *questionDetailID; // mapper id
/**
 *  问题详情
 */
@property (nonatomic, copy) NSString *url;
/**
 *  标题,如"title": "[\u753b\u601d\u7ef4\u56fe\u8f6f\u4ef6]Windows\u5e73\u53f0?",
 */
@property (nonatomic, copy) NSString *title;
/**
 *  投票,如"votes": "0",
 */
@property (nonatomic, copy) NSString *votes;
/**
 *  创建的时间戳,        "created": "1449404944",
 */
@property (nonatomic, copy) NSString *created;
/**
 *  评论数,        "comments": "0",
 */
@property (nonatomic, copy) NSString *comments;

/**
 *  创建日期，如几分钟前,        "createdDate": "17 \u5206\u949f\u524d",
 */
@property (nonatomic, copy) NSString *createdDate;
/*
 *  站点id
 */
@property (nonatomic, copy) NSString *siteId;
/**
 *  摘要
 */
@property (nonatomic, copy) NSString *excerpt;
/**
 *  原始文本
 */
@property (nonatomic, copy) NSString *originalText;
/**
 *  排版文本
 */
@property (nonatomic, copy) NSString *parsedText;

/**
 *  是否有被采纳
 */
@property (nonatomic, assign) BOOL isAccepted;
/**
 *  收藏人数
 */
@property (nonatomic, assign) NSInteger bookmarks;


/**
 *  问题共多少字
 */
@property (nonatomic, assign) NSInteger viewsWord;
/**
 *  多少人回答
 */
@property (nonatomic, assign) NSInteger answers;
/**
 *  问题是否关闭
 */
@property (nonatomic, assign) BOOL isClosed;

@property (nonatomic, assign) BOOL isLiked;

@property (nonatomic, assign) BOOL isHated;
/**
 *  是否被关注
 */
@property (nonatomic, assign) BOOL isFollowed;
/**
 *  关注人数
 */
@property (nonatomic, assign) NSInteger followers;
/**
 *  是否已经被收藏
 */
@property (nonatomic, assign) BOOL isBookmarked;

@property (nonatomic, assign) BOOL canLike;
@property (nonatomic, assign) BOOL canHate;
@property (nonatomic, assign) BOOL canEdit;
/**
 *  最后的答案
 */
@property (nonatomic, strong) ZZQuestionDetailLastAnswerModel *lastAnswer;
/**
 *  tag标签
 */
@property (nonatomic, strong) NSArray<ZZQuestionDetailTagModel> *tags;
/**
 *  用户
 */
@property (nonatomic, strong) ZZQuestionDetailUserModel *user;

@end


//------------------------------------------ZZQuestionDetailLastAnswerModel ----------------------
//        "lastAnswer": {
//            "user": {
//                "name": "ShadowMan",
//                "url": "\/u\/shadowman",
//                "id": "1030000000740829"
//            },
//            "createdDate": "5 \u5206\u949f\u524d",
//            "url": "\/q\/1010000004105910\/a-1020000004105962"
//        }





@class ZZQuestionDetailLastAnswerUserModel;

@interface ZZQuestionDetailLastAnswerModel : JSONModel
@property (nonatomic, strong) ZZQuestionDetailLastAnswerUserModel *user;
/**
 *  时间字符串
 */
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, copy) NSString *url;
@end


@interface ZZQuestionDetailLastAnswerUserModel : JSONModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *lastAnswerUserId; // mapper id
@end



//------------------------------------------ZZQuestionDetailTagModel ----------------------

//        "tags": [{
//            "name": "\u8f6f\u4ef6",
//            "url": "\/t\/%E8%BD%AF%E4%BB%B6",
//            "id": "1040000000149979",
//            "thumbnailUrl": "",
//            "iconUrl": "",
//            "similarTags": null
//        }],

@protocol ZZQuestionDetailTagModel @end;

@protocol ZZQuestionDetailTagSimilarTagModel;

@interface ZZQuestionDetailTagModel : JSONModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *tagId; // mapper id
@property (nonatomic, copy) NSString *thumbnailUrl; // 略缩图
@property (nonatomic, copy) NSString *iconUrl; //icon url
@property (nonatomic, copy) NSArray<ZZQuestionDetailTagSimilarTagModel>*similarTags; //相似的tag
@end

@protocol ZZQuestionDetailTagSimilarTagModel @end;

@interface ZZQuestionDetailTagSimilarTagModel : JSONModel
@property (nonatomic, strong) NSString *similarTagsId; // mapper id
@property (nonatomic, strong) NSString *similarTagsName; // mapper name
@end


//------------------------------------------ZZQuestionDetailUserModel ----------------------

@interface ZZQuestionDetailUserModel : JSONModel

@property (nonatomic, copy) NSString *questionDetailUserId; // mapper id
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *rank;
@property (nonatomic, copy) NSString *avataUrl;
@property (nonatomic, copy) NSString *url;

@end



