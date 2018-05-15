//
//  BBLiveNetworkAgent.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/14.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveNetworkAgent.h"
#import "BBLiveBaseRequest.h"
#import "BBLiveBaseRequest+Private.h"

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
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
        _manager.requestSerializer.timeoutInterval = 5.0f;
        
        _processingQueue = dispatch_queue_create("com.BBLiveSDK.networkagent.processing", DISPATCH_QUEUE_CONCURRENT);
        
        _manager.completionQueue = _processingQueue;
    }
    return self;
}

- (void)addRequest:(BBLiveBaseRequest *)request
{
    BBLiveRequestMethod method = [request requestMethod];
    
    NSURL *url = [request requestURL];
    NSDictionary *param = [request requestParameters];
    
    switch (method) {
        case BBLiveRequestMethodGet:
        {
            [self.manager GET:url.absoluteString
                   parameters:param
                     progress:^(NSProgress * _Nonnull downloadProgress) {
                         
                     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         [self handleSuccessResultWithResponseObject:responseObject
                                                             request:request];
                     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         [self handleFailureResultWithError:error request:request];
                     }];
        }
            break;
        case BBLiveRequestMethodPost:
        {
            [self.manager POST:url.absoluteString
                    parameters:param
                      progress:^(NSProgress * _Nonnull uploadProgress) {
                          
                      } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                          [self handleSuccessResultWithResponseObject:responseObject request:request];
                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                          [self handleFailureResultWithError:error request:request];
                      }];
        }
            break;
        default:
            break;
    }
}

- (void)handleSuccessResultWithResponseObject:(id)responseObject
                                      request:(BBLiveBaseRequest *)request
{
    // 解析数据
    if (responseObject
        && [responseObject isKindOfClass:[NSDictionary class]]) {
        [request parseResponseWithResponseObject:responseObject];
    }
    
    // 成功回调
    if (request.successCompleteBlock) {
        request.successCompleteBlock(request);
    }
}

- (void)handleFailureResultWithError:(NSError *)error
                             request:(BBLiveBaseRequest *)request
{
    // 对error做处理
    // ...
    
    // 失败回调
    if (request.failureCompleteBlock) {
        request.failureCompleteBlock(request);
    }
}

@end
