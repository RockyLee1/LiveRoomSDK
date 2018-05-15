//
//  BBLiveBaseRequest.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/14.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BBLiveRequestMethod) {
    BBLiveRequestMethodGet = 0,
    BBLiveRequestMethodPost
};

@class BBLiveBaseRequest;

typedef void(^BBLiveRequestCompleteBlock)(__kindof BBLiveBaseRequest *request);

@interface BBLiveBaseRequest : NSObject

@property (nonatomic, copy) BBLiveRequestCompleteBlock successCompleteBlock;

@property (nonatomic, copy) BBLiveRequestCompleteBlock failureCompleteBlock;

- (void)startRequest;
- (void)stopRequest;

- (void)startRequestWithCompleteBlockWithSuccess:(BBLiveRequestCompleteBlock)success
                                         failure:(BBLiveRequestCompleteBlock)failure;

#pragma mark - Subclass Override

- (BBLiveRequestMethod)requestMethod;
- (NSString *)requestPath;
- (NSDictionary *)requestCustomParameters;

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic;

@end
