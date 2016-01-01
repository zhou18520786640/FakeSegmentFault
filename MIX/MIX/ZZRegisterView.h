//
//  ZZRegisterView.h
//  MIX
//
//  Created by zhou on 16/1/1.
//  Copyright © 2016年 jeff.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ZZRegisterViewClickBlock)(NSString *name, NSString *email, NSString *password);
@interface ZZRegisterView : UIView
- (instancetype)initWithFrame:(CGRect)frame withRegisterViewClickBlock:(ZZRegisterViewClickBlock)block;
@end
