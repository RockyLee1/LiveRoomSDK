//
//  BBLiveRCloudManager.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/18.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveRCloudManager.h"
#import <RongIMLib/RongIMLib.h>
#import "BBLiveRCloudTokenRequest.h"

@interface BBLiveRCloudManager ()

@property (nonatomic, strong) BBLiveRCloudTokenRequest *RCloudTokenRequest;

@end

@implementation BBLiveRCloudManager

+ (instancetype)shareManager
{
    static BBLiveRCloudManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self initRCloud];
    }
    return self;
}

- (void)initRCloud
{
    [[RCIMClient sharedRCIMClient] initWithAppKey:@"vnroth0kv4pdo"];
}

- (void)requestRCloudTokenWithCompleteBlock:(void (^)(BOOL isSuccess, NSString *token))completeBlock
{
    if (!self.RCloudTokenRequest) {
        self.RCloudTokenRequest = [[BBLiveRCloudTokenRequest alloc] init];
    }
    
    [self.RCloudTokenRequest requestRCloudTokenWithCompleteBlock:^(NSString *token) {
        if (token.length > 0) {
            if (completeBlock) {
                completeBlock(YES, token);
            }
        } else {
            if (completeBlock) {
                completeBlock(NO, nil);
            }
        }
    }];
}

- (void)connectRCloudWithSuccessBlock:(void (^)(NSString *userId))successBlock
                         failureBlock:(void (^)(void))failureBlock
{
    [self requestRCloudTokenWithCompleteBlock:^(BOOL isSuccess, NSString *token) {
        if (isSuccess) {
            
            
            [[RCIMClient sharedRCIMClient] connectWithToken:token
                                                    success:^(NSString *userId) {
                                                        if (successBlock) {
                                                            successBlock(userId);
                                                        }
                                                    } error:^(RCConnectErrorCode status) {
                                                        if (failureBlock) {
                                                            failureBlock();
                                                        }
                                                    } tokenIncorrect:^{
                                                        // 连接融云时，报token错误，此时应该去重新获取token
                                                        // TODO:
                                                    }];
        } else {
            // token 请求失败
            // TODO:
        }
    }];
}

@end
