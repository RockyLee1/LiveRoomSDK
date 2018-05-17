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

#import <AFNetworking/AFNetworking.h>
#import <RongIMLib/RCIMClient.h>
#import <libextobjc/EXTScope.h>

@interface BBLiveUserRoom ()

@property (nonatomic, strong) BBLiveUserEnterRoomRequest *enterRoomRequest;
@property (nonatomic, strong) BBLiveRoomAudienceListRequest *audienceListRequest;

@end

@implementation BBLiveUserRoom

- (void)enterLiveUserRoom
{
    [self enterLiveUserRoomWithRoomInfo:_roomInfo];
}

- (void)enterLiveUserRoomWithRoomInfo:(BBLiveListRoomInfoModel *)roomInfo
{
    self.enterRoomRequest = [[BBLiveUserEnterRoomRequest alloc] init];
    self.enterRoomRequest.roomId = roomInfo.roomId;
    
    @weakify(self)
    [self.enterRoomRequest startEnterRoomRequestWithSuccessBlock:^(BBLiveRoomDetailInfoModel *detailInfoModel) {
        @strongify(self)
        
        self.roomDetailInfo = detailInfoModel;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.enterLiveRoomCompleteBlock) {
                self.enterLiveRoomCompleteBlock();
            }
        });
        
        // 请求观众列表
        self.audienceListRequest = [[BBLiveRoomAudienceListRequest alloc] init];
        self.audienceListRequest.anchorUid = self.roomDetailInfo.anchorUid;
        [self.audienceListRequest startRequestWithCompleteBlockWithSuccess:^(__kindof BBLiveBaseRequest *request) {
            @strongify(self)
            
            self.audienceList = [self.audienceListRequest.audienceList mutableCopy];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.liveRoomAudienceRequestCompleteBlock) {
                    self.liveRoomAudienceRequestCompleteBlock();
                }
            });
        } failure:^(__kindof BBLiveBaseRequest *request) {
            
        }];
    } failureBlock:^(NSError *error) {

    }];
    
    // 融云进房间
    [[RCIMClient sharedRCIMClient] joinChatRoom:@""
                                   messageCount:-1
                                        success:^{
                                            
                                        } error:^(RCErrorCode status) {
                                            
                                        }];
}




@end
