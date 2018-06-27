//
//  BBLiveAnchorAuthenRequest.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/29.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

/*!
 主播开播权限接口
 */

#import "BBLiveBaseRequest.h"

@interface BBLiveAnchorAuthenRequest : BBLiveBaseRequest

@property (nonatomic, assign) NSInteger auditStatus;
@property (nonatomic, copy) NSString *cause;
@property (nonatomic, assign) NSInteger broker;

@end
