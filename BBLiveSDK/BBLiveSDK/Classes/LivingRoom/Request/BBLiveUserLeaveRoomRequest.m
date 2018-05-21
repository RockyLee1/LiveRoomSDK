//
//  BBLiveUserLeaveRoomRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/21.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveUserLeaveRoomRequest.h"

@interface BBLiveUserLeaveRoomRequest ()

@property (nonatomic, strong) NSString *roomId;
@property (nonatomic, assign) BOOL isSuccess;

@end

@implementation BBLiveUserLeaveRoomRequest

- (BBLiveRequestMethod)requestMethod
{
    return BBLiveRequestMethodPost;
}

- (NSString *)requestPath
{
    return @"room/userExitRoom";
}

- (NSDictionary *)requestCustomParameters
{
    return @{@"anchorUid":_roomId ?: @""};
}

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic
{
    NSInteger code = [responseDic[@"code"] integerValue];
    if (code == 200) {
        self.isSuccess = YES;
    } else {
        self.isSuccess = NO;
    }
}

- (void)leaveRoomRequestWithRoomId:(NSString *)roomId
                      successBlock:(void (^)(void))successBlock
                      failureBlock:(void (^)(void))failureBlock
{
    self.roomId = roomId;
    
    [self startRequestWithCompleteBlockWithSuccess:^(__kindof BBLiveBaseRequest *request) {
        if ([(BBLiveUserLeaveRoomRequest *)request isSuccess]) {
            if (successBlock) {
                successBlock();
            }
        } else {
            if (failureBlock) {
                failureBlock();
            }
        }
    } failure:^(__kindof BBLiveBaseRequest *request) {
        if (failureBlock) {
            failureBlock();
        }
    }];
}

@end
