//
//  BBLiveUserRoom.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/10.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveUserRoom.h"
#import "BBLiveListRoomInfoModel.h"
#import "BBLiveRoomDetailInfoModel.h"
#import "BBLiveUserEnterRoomRequest.h"
#import "BBLiveRoomAudienceListRequest.h"
#import "BBLiveUserLeaveRoomRequest.h"

#import <AFNetworking/AFNetworking.h>
#import <RongIMLib/RCIMClient.h>
#import <libextobjc/EXTScope.h>

#import "BBLiveRCloudManager.h"

@interface BBLiveUserRoom ()<BBLiveRCloudManagerChatRoomMessageDelegate>

// 进直播间前的直播间基本信息
@property (nonatomic, strong) BBLiveListRoomInfoModel *roomInfo;
// 直播间详细信息
@property (nonatomic, strong) BBLiveRoomDetailInfoModel *roomDetailInfo;

@property (nonatomic, strong) BBLiveUserEnterRoomRequest *enterRoomRequest;
@property (nonatomic, strong) BBLiveRoomAudienceListRequest *audienceListRequest;

@property (nonatomic, strong) BBLiveUserLeaveRoomRequest *leaveRoomRequest;

@end

@implementation BBLiveUserRoom

- (instancetype)initLiveUserRoomWithInfo:(BBLiveListRoomInfoModel *)roomInfo
{
    self = [super init];
    if (self) {
        _roomInfo = roomInfo;
    }
    
    return self;
}

- (void)enterLiveUserRoom
{
    [self enterLiveUserRoomWithRoomInfo:_roomInfo];
}

- (void)enterLiveUserRoomWithRoomInfo:(BBLiveListRoomInfoModel *)roomInfo
{
    // 服务器进房间
    self.enterRoomRequest = [[BBLiveUserEnterRoomRequest alloc] init];
    self.enterRoomRequest.roomId = roomInfo.roomId;
    
    @weakify(self)
    [self.enterRoomRequest startEnterRoomRequestWithSuccessBlock:^(BBLiveRoomDetailInfoModel *detailInfoModel) {
        @strongify(self)
        
        self.roomDetailInfo = detailInfoModel;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.delegate && [self.delegate respondsToSelector:@selector(liveRoomEnterCompleteWithDetailInfoModel:)]) {
                [self.delegate liveRoomEnterCompleteWithDetailInfoModel:detailInfoModel];
            }
        });
        
        // 请求观众列表
        self.audienceListRequest = [[BBLiveRoomAudienceListRequest alloc] init];
        self.audienceListRequest.anchorUid = self.roomDetailInfo.anchorUid;
        [self.audienceListRequest startRequestWithCompleteBlockWithSuccess:^(__kindof BBLiveBaseRequest *request) {
            @strongify(self)
            
            self.audienceList = [self.audienceListRequest.audienceList mutableCopy];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.delegate && [self.delegate respondsToSelector:@selector(liveRoomAudienceListRequestCompleteWithAudienceList:)]) {
                    [self.delegate liveRoomAudienceListRequestCompleteWithAudienceList:self.audienceList];
                }
            });
        } failure:^(__kindof BBLiveBaseRequest *request) {
            
        }];
    } failureBlock:^(NSError *error) {

    }];
    
    // 融云进房间
    [[BBLiveRCloudManager shareManager] joinChatRoomWithRoomId:roomInfo.roomId
                                       chatRoomMessageDelegate:self
                                                  successBlock:^{
                                                      
                                                  } failureBlock:^{
                                                      
                                                  }];
}

- (void)leaveLiveUserRoom
{
    // 服务器退房
    if (!self.leaveRoomRequest) {
        self.leaveRoomRequest = [[BBLiveUserLeaveRoomRequest alloc] init];
    }
    [self.leaveRoomRequest leaveRoomRequestWithRoomId:_roomInfo.roomId
                                         successBlock:^{
                                             
                                         } failureBlock:^{
                                             
                                         }];
    
    // 融云退房
    [[BBLiveRCloudManager shareManager] quitChatRoomWithRoomId:_roomInfo.roomId
                                                  successBlock:^{
                                                      
                                                  } failureBlock:^{
                                                      
                                                  }];
    
}

#pragma mark - BBLiveRCloudManagerChatRoomMessageDelegate

- (void)BBLiveChatRoomMessageDidReceivedWithMessageType:(NSString *)messageType
                                             messageDic:(NSDictionary *)messageDic
{
    BBLiveRoomMessageType type = [messageType integerValue];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(liveRoomLiveMessageWithMessageType:messageDic:)]) {
            [self.delegate liveRoomLiveMessageWithMessageType:type
                                                   messageDic:messageDic];
        }
    });
    
    switch (type) {
        case BBLiveRoomMessageTypeChatRoomNormalMsg:
            
            break;
            
        case BBLiveRoomMessageTypeEnterRoomMsg:
            
            break;
            
        case BBLiveRoomMessageTypeLeaveRoomMsg:
            
            break;
            
        case BBLiveRoomMessageTypeInviteMicConnect:
            
            break;
            
        case BBLiveRoomMessageTypeInviteMicConnectConfirm:
            
            break;
            
        case BBLiveRoomMessageTypeShutUpMsg:
            
            break;
        case BBLiveRoomMessageTypeSendGift:
            
            break;
        case BBLiveRoomMessageTypePrizeMsg:
            
            break;
        case BBLiveRoomMessageTypeLevelUpMsg:
            
            break;
        case BBLiveRoomMessageTypeRanking:
            
            break;
        case BBLiveRoomMessageTypeTrack:
            
            break;
        case BBLiveRoomMessageTypeAttention:
            
            break;
        case BBLiveRoomMessageTypeFrontOrBack:
            
            break;
        default:
            break;
    }
    
}

@end
