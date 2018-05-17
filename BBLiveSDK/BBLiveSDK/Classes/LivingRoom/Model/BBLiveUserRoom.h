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

@property (nonatomic, strong) BBLiveListRoomInfoModel *roomInfo;
@property (nonatomic, strong) BBLiveRoomDetailInfoModel *roomDetailInfo;

@property (nonatomic, copy) void (^enterLiveRoomCompleteBlock)(void);

- (void)enterLiveUserRoom;
- (void)enterLiveUserRoomWithRoomInfo:(BBLiveListRoomInfoModel *)roomInfo;

@end
