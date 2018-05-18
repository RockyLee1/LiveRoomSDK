//
//  BBLiveRCloudTokenRequest.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/18.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest.h"

@interface BBLiveRCloudTokenRequest : BBLiveBaseRequest

- (void)requestRCloudTokenWithCompleteBlock:(void (^)(NSString *token))completeBlock;

@end
