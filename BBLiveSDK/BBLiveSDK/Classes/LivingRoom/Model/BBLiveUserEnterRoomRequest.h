//
//  BBLiveUserEnterRoomRequest.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/16.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest.h"

@class BBLiveRoomDetailInfoModel;

@interface BBLiveUserEnterRoomRequest : BBLiveBaseRequest

@property (nonatomic, strong) NSString *roomId;

@property (nonatomic, strong) BBLiveRoomDetailInfoModel *detailInfoModel;

- (void)startEnterRoomRequestWithSuccessBlock:(void (^)(BBLiveRoomDetailInfoModel *detailInfoModel))success
                                 failureBlock:(void (^)(NSError *error))failureBlock;

@end
