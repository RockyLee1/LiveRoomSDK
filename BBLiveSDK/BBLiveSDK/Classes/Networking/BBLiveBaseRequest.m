//
//  BBLiveBaseRequest.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/14.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest.h"
#import <AFNetworking/AFNetworking.h>

@interface BBLiveBaseRequest ()

//@property (nonatomic, strong)

@end

@implementation BBLiveBaseRequest

//- (void)requestWithMethod:(BBLiveRequestMethod)requestMethod

- (BBLiveRequestMethod)requestMethod
{
    // default is get
    return BBLiveRequestMethodGet;
}

- (NSString *)baseURLString
{
    return @"";
}

- (NSString *)requestPath
{
    return @"";
}

- (NSDictionary *)requestParameters
{
    return nil;
}

- (void)requestWithMethod:(BBLiveRequestMethod)requestMethod
               parameters:(NSDictionary *)parameters
                  success:(void (^)(void))success
                  failure:(void (^)(void))failure
{
    
}

@end
