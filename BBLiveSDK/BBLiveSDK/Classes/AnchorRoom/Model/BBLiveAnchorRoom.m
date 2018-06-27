//
//  BBLiveAnchorRoom.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/25.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveAnchorRoom.h"

#import "BBLiveAnchorAuthenRequest.h"
#import "BBLiveAnchorLiveInfoRequest.h"
#import "BBLiveAnchorLivingRequest.h"

#import <PLRTCStreamingKit/PLRTCStreamingKit.h>

@interface BBLiveAnchorRoom ()

@property (nonatomic, strong) BBLiveAnchorAuthenRequest *authenRequest;
@property (nonatomic, strong) BBLiveAnchorLiveInfoRequest *anchorLiveInfoRequest;
@property (nonatomic, strong) BBLiveAnchorLivingRequest *anchorLivingRequest;

@end

@implementation BBLiveAnchorRoom

- (BBLiveAnchorAuthenRequest *)authenRequest
{
    if (!_authenRequest) {
        _authenRequest = [[BBLiveAnchorAuthenRequest alloc] init];
    }
    
    return _authenRequest;
}

- (BBLiveAnchorLiveInfoRequest *)anchorLiveInfoRequest
{
    if (!_anchorLiveInfoRequest) {
        _anchorLiveInfoRequest = [[BBLiveAnchorLiveInfoRequest alloc] init];
    }
    
    return _anchorLiveInfoRequest;
}

- (BBLiveAnchorLivingRequest *)anchorLivingRequest
{
    if (!_anchorLivingRequest) {
        _anchorLivingRequest = [[BBLiveAnchorLivingRequest alloc] init];
    }
    
    return _anchorLivingRequest;
}

- (void)checkAnchorLiveAuthenWithSuccessBlock:(void (^)(void))successBlock
{
    [self.authenRequest startRequestWithCompleteBlockWithSuccess:^(__kindof BBLiveAnchorAuthenRequest *request) {
        if (request.auditStatus == 3) {
            if (successBlock) {
                successBlock();
            }
        }
    } failure:^(__kindof BBLiveBaseRequest *request) {
        
    }];
}

- (void)requestLiveInfoWithCompleteBlock:(void (^)(void))completeBlock
{
    [self.anchorLiveInfoRequest startRequestWithCompleteBlockWithSuccess:^(__kindof BBLiveBaseRequest *request) {
        
    } failure:^(__kindof BBLiveBaseRequest *request) {
        
    }];
}

- (void)startLiving
{
    
}

@end
