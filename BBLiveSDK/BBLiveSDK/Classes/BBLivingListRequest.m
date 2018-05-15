//
//  BBLivingListRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/15.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLivingListRequest.h"

@implementation BBLivingListRequest

- (NSDictionary *)requestCustomParameters
{
    return @{@"type":@(2)};
}

- (NSString *)requestPath
{
    return @"room/getLiveList";
}

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic
{
    
}

@end
