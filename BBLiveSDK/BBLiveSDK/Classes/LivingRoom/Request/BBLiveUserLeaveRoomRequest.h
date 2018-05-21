//
//  BBLiveUserLeaveRoomRequest.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/21.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest.h"

@interface BBLiveUserLeaveRoomRequest : BBLiveBaseRequest

- (void)leaveRoomRequestWithRoomId:(NSString *)roomId
                      successBlock:(void (^)(void))successBlock
                      failureBlock:(void (^)(void))failureBlock;

@end
