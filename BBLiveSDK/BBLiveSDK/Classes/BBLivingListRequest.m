//
//  BBLivingListRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/15.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLivingListRequest.h"
#import <MJExtension/MJExtension.h>
#import "BBLivingModel.h"

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
//    anchorLevel = 14;
//    avatar = "";
//    city = "\U4e0a\U6d77\U5e02";
//    distance = 0;
//    domain = "rtmp://pili-live-rtmp.91banban.cn/shanghaiyuemeng/91banbancntesting77736";
//    fire = 0;
//    isliving = 1;
//    livingImg = "http://out8i00tg.bkt.clouddn.com/FiWrPC_9XhxLjdhpi2ryoUKKwD5d";
//    nickname = "\U5947\U4e50\U4f19\U4f3477736";
//    sex = 0;
//    signature = "Ta \U4ec0\U4e48\U90fd\U6ca1\U6709\U7559\U4e0b\U2026\U2026";
//    slogan = "";
//    uid = 77736;
//    userLevel = 22;
    
    
    NSArray *dataArray = [responseDic objectForKey:@"data"];
    
    if ([dataArray isKindOfClass:[NSArray class]]) {
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (NSDictionary *dic in dataArray) {
            BBLivingModel *model = [BBLivingModel mj_objectWithKeyValues:dic];
            
            [tmpArray addObject:model];
        }
        
        self.list = [tmpArray copy];
    }
}

@end
