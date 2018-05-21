//
//  BBLiveManager.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/15.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveManager.h"

@interface BBLiveManager ()

@property (nonatomic, strong) BBLiveConfig *liveConfig;
@property (nonatomic, strong) FetchCommonParamsBlock fetchCommonParamsBlock;

@end

@implementation BBLiveManager

+ (instancetype)shareLiveManager
{
    static BBLiveManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)configLiveManagerWithConfig:(BBLiveConfig *)config
{
    self.liveConfig = config;
}

- (void)configLiveRequestFetchCommonParamsBlock:(FetchCommonParamsBlock)fetchBlock
{
    self.fetchCommonParamsBlock = fetchBlock;
}

//- (void)

@end
