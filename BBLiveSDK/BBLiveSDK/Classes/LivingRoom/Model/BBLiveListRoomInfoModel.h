//
//  BBLiveListRoomInfoModel.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/16.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBLiveListRoomInfoModel : NSObject

// 房间id (目前房间id就是主播id)
@property (nonatomic, strong) NSString *roomId;

// 直播地址（拉流地址） eg:rtmp://...
@property (nonatomic, strong) NSString *livingURL;

// 开播封面
@property (nonatomic, strong) NSString *livingCoverImageURL;

@end
