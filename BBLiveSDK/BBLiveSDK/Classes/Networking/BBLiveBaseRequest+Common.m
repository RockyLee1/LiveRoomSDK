//
//  BBLiveBaseRequest+Common.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/15.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest+Common.h"
#import "BBLiveManager.h"
#import "BBLiveConfig.h"
#import <FCUUID/FCUUID.h>
#import "NSString+BBLiveSDKTools.h"

#import <CommonCrypto/CommonDigest.h>


@implementation BBLiveBaseRequest (Common)

- (NSString *)baseURLString
{
    return @"http://dev.91banban.com/zbapp/";
}

- (NSDictionary *)requestCommonParameters
{
    BBLiveConfig *config = [BBLiveManager shareLiveManager].liveConfig;

    NSString *versionCode = config.versionCode;
    const NSString *seed = @"banban123456";
    NSTimeInterval requestTime = [self requestTime];
    long long requestTimeLong = [@(requestTime) longLongValue];
    NSString *imei = [FCUUID uuidForDevice];
    NSString *os = config.os;
    NSString *token = config.token ?: @"";
    
    // 加密
    NSString *ncode = [NSString stringWithFormat:@"%@%@%@%@",seed,imei,os,@(requestTimeLong)];
    ncode = [[ncode MD5String] MD5String];
    
    
    NSDictionary *commonParamsDic = nil;
    
    commonParamsDic = @{
                        @"versionCode":versionCode,
                        @"os":os,
                        @"reqtime":@(requestTimeLong),
                        @"ncode":ncode,
                        @"imei":imei,
                        @"token":token
                        };
    
//    if ([BBLiveManager shareLiveManager].fetchCommonParamsBlock) {
//        commonParamsDic = [BBLiveManager shareLiveManager].fetchCommonParamsBlock();
//    }
    
    return commonParamsDic;
}

#pragma mark - Dynamic Params

- (NSTimeInterval)requestTime
{
    NSDate *date = [NSDate date];
    NSTimeInterval timeInterval = [date timeIntervalSince1970] * 1000;
    
    return timeInterval;
}

@end
