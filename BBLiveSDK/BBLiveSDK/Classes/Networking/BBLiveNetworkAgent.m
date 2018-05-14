//
//  BBLiveNetworkAgent.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/14.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveNetworkAgent.h"
#import "BBLiveBaseRequest.h"


#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

@interface BBLiveNetworkAgent ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) dispatch_queue_t processingQueue;

@end

@implementation BBLiveNetworkAgent

+ (BBLiveNetworkAgent *)shareAgent
{
    static BBLiveNetworkAgent *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    
    return shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:nil];
        _processingQueue = dispatch_queue_create("com.yuantiku.networkagent.processing", DISPATCH_QUEUE_CONCURRENT);
        
        _manager.completionQueue = _processingQueue;
        
    }
    return self;
}

- (void)addRequest:(BBLiveBaseRequest *)request
{
    
    BBLiveRequestMethod method = [request requestMethod];
//    NSString *url = [request req]
    NSDictionary *param = [request requestParameters];
    
    NSString
    switch (method) {
        case BBLiveRequestMethodGet:
            
            break;
        case BBLiveRequestMethodPost:
            
            break;
        default:
            break;
    }
    
    
}

@end
