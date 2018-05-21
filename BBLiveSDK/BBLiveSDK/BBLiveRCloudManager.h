//
//  BBLiveRCloudManager.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/18.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BBLiveRCloudManagerMessageDelegate <NSObject>

@end

@interface BBLiveRCloudManager : NSObject

@property (nonatomic, weak) id <BBLiveRCloudManagerMessageDelegate>messageDelegate;

+ (instancetype)shareManager;

- (void)connectRCloudWithSuccessBlock:(void (^)(NSString *userId))successBlock
                         failureBlock:(void (^)(void))failureBlock;

@end
