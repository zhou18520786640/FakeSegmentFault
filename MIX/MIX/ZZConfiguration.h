//
//  ZZConfiguration.h
//  MIX
//
//  Created by zhou on 15/12/26.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZConfiguration : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *token;

+ (instancetype)sharedConfigration;

@end
