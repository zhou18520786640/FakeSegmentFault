//
//  ZZLoginViewController.h
//  MIX
//
//  Created by zhou on 15/12/24.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZViewController.h"
typedef void (^FinishLoginBlock)();
@interface ZZLoginViewController : ZZViewController
- (instancetype)initWithFinishLogin:(FinishLoginBlock)finishLoginBlock;
@end
