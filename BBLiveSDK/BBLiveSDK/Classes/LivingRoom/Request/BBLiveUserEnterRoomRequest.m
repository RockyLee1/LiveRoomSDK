//
//  BBLiveUserEnterRoomRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/16.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveUserEnterRoomRequest.h"
#import <MJExtension/MJExtension.h>
#import "BBLiveRoomDetailInfoModel.h"

@implementation BBLiveUserEnterRoomRequest

- (BBLiveRequestMethod)requestMethod
{
    return BBLiveRequestMethodPost;
}

- (NSString *)requestPath
{
    return @"room/userEnterRoom";
}

- (NSDictionary *)requestCustomParameters
{
    return @{@"anchorUid":(_roomId ?: @"")};
}

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic
{
    NSDictionary *dataDic = responseDic[@"data"];
    BBLiveRoomDetailInfoModel *detailInfoModel = [BBLiveRoomDetailInfoModel mj_objectWithKeyValues:dataDic];
    
    self.detailInfoModel = detailInfoModel;
}

- (void)startEnterRoomRequestWithSuccessBlock:(void (^)(BBLiveRoomDetailInfoModel *detailInfoModel))success
                                 failureBlock:(void (^)(NSError *error))failureBlock
{
    [self startRequestWithCompleteBlockWithSuccess:^(__kindof BBLiveBaseRequest *request) {
        BBLiveUserEnterRoomRequest *enterRoomRequest = (BBLiveUserEnterRoomRequest *)request;
        if (success) {
            success(enterRoomRequest.detailInfoModel);
        }
    } failure:^(__kindof BBLiveBaseRequest *request) {
        
    }];
}

@end
