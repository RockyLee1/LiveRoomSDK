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

@protocol BBLiveRCloudManagerChatRoomMessageDelegate <NSObject>

- (void)BBLiveChatRoomMessageDidReceivedWithMessageType:(NSString *)messageType
                                             messageDic:(NSDictionary *)messageDic;

@end

@interface BBLiveRCloudManager : NSObject

@property (nonatomic, weak) id <BBLiveRCloudManagerMessageDelegate>messageDelegate;
@property (nonatomic, weak) id <BBLiveRCloudManagerChatRoomMessageDelegate>chatRoomMessageDelegate;

+ (instancetype)shareManager;

- (void)connectRCloudWithSuccessBlock:(void (^)(NSString *userId))successBlock
                         failureBlock:(void (^)(void))failureBlock;

- (void)joinChatRoomWithRoomId:(NSString *)roomId
       chatRoomMessageDelegate:(id<BBLiveRCloudManagerChatRoomMessageDelegate>)chatRoomMessageDelegate
                  successBlock:(void (^)(void))successBlock
                  failureBlock:(void (^)(void))failureBlock;

- (void)quitChatRoomWithRoomId:(NSString *)roomId
                  successBlock:(void (^)(void))successBlock
                  failureBlock:(void (^)(void))failureBlock;

@end
