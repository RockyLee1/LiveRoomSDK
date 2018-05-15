//
//  BBLiveManager.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/15.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BBLiveConfig;


typedef NSDictionary *(^FetchCommonParamsBlock)(void);

@interface BBLiveManager : NSObject

@property (nonatomic, strong, readonly) BBLiveConfig *liveConfig;
@property (nonatomic, strong, readonly) FetchCommonParamsBlock fetchCommonParamsBlock;

+ (instancetype)shareLiveManager;

- (void)configLiveRequestFetchCommonParamsBlock:(FetchCommonParamsBlock)fetchBlock;

- (void)configLiveManagerWithConfig:(BBLiveConfig *)config;

@end
