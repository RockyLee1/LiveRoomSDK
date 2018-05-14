//
//  BBLiveUserRoom.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/10.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveUserRoom.h"
#import "BBLiveUserRoomInfoModel.h"

#import <AFNetworking/AFNetworking.h>
#import <RongIMLib/RCIMClient.h>

@implementation BBLiveUserRoom

- (void)enterLiveUserRoomWithRoomInfo:(BBLiveUserRoomInfoModel *)roomInfo
{
    //1 获取房间主播信息
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.securityPolicy = nil;
    
    
    // 融云进房间
    [[RCIMClient sharedRCIMClient] joinChatRoom:@""
                                   messageCount:-1
                                        success:^{
                                            
                                        } error:^(RCErrorCode status) {
                                            
                                        }];
    
}




@end
