//
//  BBLiveGiftRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/23.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveGiftRequest.h"
#import <MJExtension/MJExtension.h>

@implementation BBLiveGiftRequest

- (NSString *)requestPath
{
    return @"gift/giftList";
}

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic
{
    NSDictionary *dataDic = responseDic[@"data"];
    if (dataDic
        && [dataDic isKindOfClass:[NSDictionary class]]) {
        NSArray *actlist = dataDic[@"actlist"];
        NSArray *giftsend = dataDic[@"giftsend"];
        NSArray *giftwiser = dataDic[@"giftwiser"];
        
        if (giftsend && [giftsend isKindOfClass:[NSArray class]]) {
            NSMutableArray *giftsendTemp = [NSMutableArray array];
            for (NSDictionary *dic in giftsend) {
                BBLiveGiftModel *model = [BBLiveGiftModel mj_objectWithKeyValues:dic];
                
                
                
                [giftsendTemp addObject:model];
            }
            
            self.giftList = [giftsendTemp copy];
        }
        
    }
}

@end
