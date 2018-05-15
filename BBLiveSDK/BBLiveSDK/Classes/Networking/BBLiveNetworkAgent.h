//
//  BBLiveNetworkAgent.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/14.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BBLiveBaseRequest;

@interface BBLiveNetworkAgent : NSObject

+ (BBLiveNetworkAgent *)shareAgent;

- (void)addRequest:(BBLiveBaseRequest *)request;

@end
