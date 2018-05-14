//
//  BBLiveUserRoom.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/10.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BBLiveUserRoomInfoModel;

@interface BBLiveUserRoom : NSObject

- (void)enterLiveUserRoomWithRoomInfo:(BBLiveUserRoomInfoModel *)roomInfo;

@end
