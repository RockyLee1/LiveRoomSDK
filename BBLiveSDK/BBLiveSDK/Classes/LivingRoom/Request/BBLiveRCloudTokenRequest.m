//
//  BBLiveRCloudTokenRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/18.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveRCloudTokenRequest.h"

@interface BBLiveRCloudTokenRequest ()

@property (nonatomic, copy) NSString *token;

@end

@implementation BBLiveRCloudTokenRequest

- (NSString *)requestPath
{
    return @"other/RYToken";
}

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic
{
    NSString *token = responseDic[@"data"][@"token"];
    
    self.token = token;
}

- (void)requestRCloudTokenWithCompleteBlock:(void (^)(NSString *token))completeBlock
{
    self.token = nil;
    
    [self startRequestWithCompleteBlockWithSuccess:^(__kindof BBLiveBaseRequest *request) {
        if (completeBlock) {
            BBLiveRCloudTokenRequest *tmpRequest = (BBLiveRCloudTokenRequest *)request;
            completeBlock(tmpRequest.token);
        }
    } failure:^(__kindof BBLiveBaseRequest *request) {
        if (completeBlock) {
            BBLiveRCloudTokenRequest *tmpRequest = (BBLiveRCloudTokenRequest *)request;
            completeBlock(tmpRequest.token);
        }
    }];
}

@end
