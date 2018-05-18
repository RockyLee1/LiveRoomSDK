//
//  BBLiveRCloudManager.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/18.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBLiveRCloudManager : NSObject

+ (instancetype)shareManager;

- (void)connectRCloudWithSuccessBlock:(void (^)(NSString *userId))successBlock
                         failureBlock:(void (^)(void))failureBlock;

@end
