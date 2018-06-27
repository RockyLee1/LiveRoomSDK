//
//  BBLiveAnchorLiveInfoRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/29.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveAnchorLiveInfoRequest.h"

@interface BBLiveAnchorLiveInfoRequest ()

@property (nonatomic, copy) NSString *pushUrl;

@end

@implementation BBLiveAnchorLiveInfoRequest

- (NSString *)requestPath
{
    return @"live/liveinfo";
}

- (NSDictionary *)requestCustomParameters
{
    return @{@"slogan":_liveTitle ?: @""};
}

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic
{
    self.pushUrl = responseDic[@"data"][@"pushUrl"];
}

@end
