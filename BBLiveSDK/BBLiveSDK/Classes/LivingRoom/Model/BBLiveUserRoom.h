//
//  BBLiveUserRoom.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/10.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BBLiveListRoomInfoModel;
@class BBLiveRoomDetailInfoModel;

@interface BBLiveUserRoom : NSObject

// 进直播间前的直播间基本信息
@property (nonatomic, strong) BBLiveListRoomInfoModel *roomInfo;

// 直播间详细信息
@property (nonatomic, strong) BBLiveRoomDetailInfoModel *roomDetailInfo;

@property (nonatomic, copy) void (^enterLiveRoomCompleteBlock)(void);
@property (nonatomic, copy) void (^liveRoomAudienceRequestCompleteBlock)(void);

- (void)enterLiveUserRoom;
- (void)enterLiveUserRoomWithRoomInfo:(BBLiveListRoomInfoModel *)roomInfo;

@end
