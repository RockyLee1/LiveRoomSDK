//
//  BBLive.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/18.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLive.h"

#import "BBLiveRCloudManager.h"

#import <PLRTCStreamingKit/PLRTCStreamingKit.h>

@implementation BBLive

+ (void)initBBLiveSDK
{
    [[BBLiveRCloudManager shareManager] connectRCloudWithSuccessBlock:^(NSString *userId) {
        
    } failureBlock:^{
        
    }];
    
    [PLStreamingEnv initEnv];
}

@end
