//
//  BBLiveUserRoom.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/10.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveUserRoom.h"
#import "BBLiveListRoomInfoModel.h"
#import "BBLiveUserEnterRoomRequest.h"

#import <AFNetworking/AFNetworking.h>
#import <RongIMLib/RCIMClient.h>

@interface BBLiveUserRoom ()

@property (nonatomic, strong) BBLiveUserEnterRoomRequest *enterRoomRequest;

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
    [self.enterRoomRequest startRequestWithCompleteBlockWithSuccess:^(__kindof BBLiveBaseRequest *request) {
        
    } failure:^(__kindof BBLiveBaseRequest *request) {
        
    }];
    
    
    //1 获取房间主播信息
    
    
    // 融云进房间
    [[RCIMClient sharedRCIMClient] joinChatRoom:@""
                                   messageCount:-1
                                        success:^{
                                            
                                        } error:^(RCErrorCode status) {
                                            
                                        }];
    
}




@end
