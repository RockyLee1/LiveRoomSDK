//
//  BBLiveRoomAudienceListRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/17.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveRoomAudienceListRequest.h"
#import "BBLiveAudienceModel.h"
#import <MJExtension/MJExtension.h>

@implementation BBLiveRoomAudienceListRequest

- (BBLiveRequestMethod)requestMethod
{
    return BBLiveRequestMethodGet;
}

- (NSString *)requestPath
{
    return @"room/getAudienceList";
}

- (NSDictionary *)requestCustomParameters
{
    return @{@"anchorUid":@(_anchorUid)};
}

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic
{
    NSArray *dataArray = responseDic[@"data"];
    if (dataArray
        && dataArray.count > 0
        && [dataArray isKindOfClass:[NSArray class]]) {
        
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (NSDictionary *dic in dataArray) {
            BBLiveAudienceModel *audienceModel = [BBLiveAudienceModel mj_objectWithKeyValues:dic];
            [tmpArray addObject:audienceModel];
        }
        
        self.audienceList = [tmpArray copy];
    }
}

@end
