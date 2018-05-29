//
//  BBLiveUserRoom.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/10.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

/*!
 用户房间
 封装了进房逻辑和融云的进房逻辑，(后期可能会加上其他和房间业务相关的逻辑)
 */

#import <Foundation/Foundation.h>

@class BBLiveListRoomInfoModel;
@class BBLiveRoomDetailInfoModel;
@class BBLiveAudienceModel;

typedef NS_ENUM(NSInteger, BBLiveRoomMessageType) {
    BBLiveRoomMessageTypeUnknown                        = 0,    // 未知消息
    BBLiveRoomMessageTypeChatRoomNormalMsg              = 2,    // 普通消息
    
    BBLiveRoomMessageTypeEnterRoomMsg                   = 100,  // 进入房间
    BBLiveRoomMessageTypeLeaveRoomMsg                   = 101,  // 离开房间
    
    BBLiveRoomMessageTypeInviteMicConnect               = 102,   // 连麦消息
    BBLiveRoomMessageTypeInviteMicConnectConfirm        = 104,   // 连麦确认
    
    BBLiveRoomMessageTypeShutUpMsg                      = 105,   // 禁言消息
    
    BBLiveRoomMessageTypeSendGift                       = 107,  // 送礼
    BBLiveRoomMessageTypePrizeMsg                       = 108,  // 中奖
    BBLiveRoomMessageTypeLevelUpMsg                     = 109,  // 升级消息
    BBLiveRoomMessageTypeRanking                        = 110,  // 热榜
    BBLiveRoomMessageTypeTrack                          = 111,  // 跑道消息
    BBLiveRoomMessageTypeAttention                      = 112,  // 关注主播消息
    BBLiveRoomMessageTypeFrontOrBack                    = 114,  // 主播切换前后台
    
    BBLiveRoomMessageTypeLiveRoomClose                  = 122   // 直播间关闭

};

@protocol BBLiveUserRoomDelegate <NSObject>

- (void)liveRoomEnterCompleteWithDetailInfoModel:(BBLiveRoomDetailInfoModel *)detailInfoModel;
- (void)liveRoomAudienceListRequestCompleteWithAudienceList:(NSArray <__kindof BBLiveAudienceModel *>*)audienceList;
- (void)liveRoomLiveMessageWithMessageType:(BBLiveRoomMessageType)messageType
                                messageDic:(NSDictionary *)messageDic;
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

- (void)leaveLiveUserRoom;

@end
