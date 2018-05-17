//
//  BBLiveRoomHandle.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/8.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "BBLiveListRoomInfoModel.h"

@interface BBLiveRoomHandle : NSObject

+ (UIViewController *)liveRoomWithRoomURL:(NSString *)url;

+ (UIViewController *)liveRoomWithListRoomInfo:(BBLiveListRoomInfoModel *)roomInfo;

@end
