//
//  BBLiveAnchorLiveInfoRequest.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/29.
//  Copyright © 2018年 linzuhan. All rights reserved.
//
/*!
 主播开播信息
 */

#import "BBLiveBaseRequest.h"

@interface BBLiveAnchorLiveInfoRequest : BBLiveBaseRequest

@property (nonatomic, copy) NSString *liveTitle;

@property (nonatomic, copy, readonly) NSString *pushUrl;

@end
