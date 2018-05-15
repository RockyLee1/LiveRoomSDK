//
//  BBLiveBaseRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/14.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest.h"
#import <AFNetworking/AFNetworking.h>

#import "BBLiveNetworkAgent.h"

@interface BBLiveBaseRequest ()

//@property (nonatomic, strong)

@end

@implementation BBLiveBaseRequest

#pragma mark - Subclass Override

- (BBLiveRequestMethod)requestMethod
{
    // default is GET
    return BBLiveRequestMethodGet;
}

- (NSURL *)requestURL
{
    NSString *baseURLString = [self baseURLString];
    NSString *requestPath = [self requestPath];
    
    return [NSURL URLWithString:[baseURLString stringByAppendingString:requestPath]];
}

- (NSString *)baseURLString
{
    return @"http://dev.91banban.com/zbapp/";
}

- (NSString *)requestPath
{
    return @"";
}

- (NSDictionary *)requestParameters
{
    NSDictionary *dic1 = [self requestCommonParameters];
    NSDictionary *dic2 = [self requestCustomParameters];
    
    NSMutableDictionary *tmpDic = [dic1 mutableCopy];
    [tmpDic addEntriesFromDictionary:dic2];
    
    return tmpDic;
}

- (NSDictionary *)requestCustomParameters
{
    return nil;
}

- (NSDictionary *)requestCommonParameters
{
    return nil;
}

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic
{
    // do nothing
}

#pragma mark - Request Action Method

- (void)startRequest
{
    [[BBLiveNetworkAgent shareAgent] addRequest:self];
}

- (void)stopRequest
{
    
}

- (void)startRequestWithCompleteBlockWithSuccess:(BBLiveRequestCompleteBlock)success
                                         failure:(BBLiveRequestCompleteBlock)failure
{
    self.successCompleteBlock = success;
    self.failureCompleteBlock = failure;
    
    [self startRequest];
}

@end
