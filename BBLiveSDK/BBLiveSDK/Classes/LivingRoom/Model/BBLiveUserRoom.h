//
//  BBLiveUserRoom.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/10.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

/* 封装了进房逻辑和融云的进房逻辑，(后期可能会加上其他和房间业务相关的逻辑) */

#import <Foundation/Foundation.h>

@class BBLiveListRoomInfoModel;
@class BBLiveRoomDetailInfoModel;
@class BBLiveAudienceModel;

@protocol BBLiveUserRoomDelegate <NSObject>

- (void)liveRoomEnterCompleteWithDetailInfoModel:(BBLiveRoomDetailInfoModel *)detailInfoModel;
- (void)liveRoomAudienceListRequestCompleteWithAudienceList:(NSArray <__kindof BBLiveAudienceModel *>*)audienceList;

@end

@interface BBLiveUserRoom : NSObject

// 直播间详细信息
@property (nonatomic, strong, readonly) BBLiveRoomDetailInfoModel *roomDetailInfo;

// 观众列表
@property (nonatomic, strong) NSMutableArray <__kindof BBLiveAudienceModel *>*audienceList;

@property (nonatomic, weak) id <BBLiveUserRoomDelegate>delegate;

- (instancetype)initLiveUserRoomWithInfo:(BBLiveListRoomInfoModel *)roomInfo;

- (void)enterLiveUserRoom;
- (void)enterLiveUserRoomWithRoomInfo:(BBLiveListRoomInfoModel *)roomInfo;

@end
