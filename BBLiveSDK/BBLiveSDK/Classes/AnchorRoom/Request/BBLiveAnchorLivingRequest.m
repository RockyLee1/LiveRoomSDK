//
//  BBLiveAnchorLivingRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/29.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveAnchorLivingRequest.h"

@implementation BBLiveAnchorLivingRequest

- (BBLiveRequestMethod)requestMethod
{
    return BBLiveRequestMethodPost;
}

- (NSString *)requestPath
{
    return @"live/live";
}

@end
