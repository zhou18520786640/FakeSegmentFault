//
//  ZZLoginThirdPartyView.h
//  MIX
//
//  Created by zhou on 16/1/2.
//  Copyright © 2016年 jeff.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZZLoginThirdPartyViewType) {
    ZZLoginThirdPartyViewTypeGoogle,
    ZZLoginThirdPartyViewTypeSina,
    ZZLoginThirdPartyViewTypeGithub,
    ZZLoginThirdPartyViewTypeQQ,
    ZZLoginThirdPartyViewTypeWeChat
};
typedef void(^ZZLoginThirdPartyViewBlock)(ZZLoginThirdPartyViewType type);

@interface ZZLoginThirdPartyView : UIView
- (instancetype)initWithFrame:(CGRect)frame thirdPartyIconDidPressedblock:(ZZLoginThirdPartyViewBlock)block;
@end
