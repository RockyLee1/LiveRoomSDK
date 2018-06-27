//
//  BBLiveAnchorAuthenRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/29.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveAnchorAuthenRequest.h"

@implementation BBLiveAnchorAuthenRequest

- (NSString *)requestPath
{
    return @"live/getauthen";
}

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic
{
    NSDictionary *dataDic = responseDic[@"data"];
    if (dataDic && [dataDic isKindOfClass:[NSDictionary class]]) {
        self.auditStatus = [dataDic[@"auditStatus"] integerValue];
        self.cause = dataDic[@"cause"];
        self.broker = [dataDic[@"broker"] integerValue];
    }
}

@end
