//
//  BBLiveAnchorRoom.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/25.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

/*!
 主播房间
 */

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BBLiveAnchorRoomAuthenStatus) {
    BBLiveAnchorRoomAuthenStatusUnauthen = 0, // 未认证
    BBLiveAnchorRoomAuthenStatusAuditing,     // 提交待审核
    BBLiveAnchorRoomAuthenStatusReject,       // 驳回，被拒 ❌
    BBLiveAnchorRoomAuthenStatusPassed        // 通过      ✅
};


@protocol BBLiveAnchorRoomDelegate <NSObject>

- (void)liveAnchorRoomAuthenCompleteWithAuthenStatus:(BBLiveAnchorRoomAuthenStatus)status
                                              reason:(NSString *)reason;

@end

@interface BBLiveAnchorRoom : NSObject



@end
