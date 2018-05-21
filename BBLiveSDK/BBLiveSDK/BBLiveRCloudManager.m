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

@interface BBLiveRCloudManager ()<
RCIMClientReceiveMessageDelegate,
RCConnectionStatusChangeDelegate,
RCChatRoomStatusDelegate
>

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
            
            [[RCIMClient sharedRCIMClient] setReceiveMessageDelegate:self object:nil];
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

- (void)joinChatRoomWithRoomId:(NSString *)roomId
       chatRoomMessageDelegate:(id<BBLiveRCloudManagerChatRoomMessageDelegate>)chatRoomMessageDelegate
                  successBlock:(void (^)(void))successBlock
                  failureBlock:(void (^)(void))failureBlock
{
    self.chatRoomMessageDelegate = chatRoomMessageDelegate;
    
    [[RCIMClient sharedRCIMClient] setChatRoomStatusDelegate:self];
    [[RCIMClient sharedRCIMClient] joinChatRoom:roomId
                                   messageCount:-1
                                        success:^{
                                            if (successBlock) {
                                                successBlock();
                                            }
                                        } error:^(RCErrorCode status) {
                                            if (failureBlock) {
                                                failureBlock();
                                            }
                                        }];
}

- (void)quitChatRoomWithRoomId:(NSString *)roomId
                  successBlock:(void (^)(void))successBlock
                  failureBlock:(void (^)(void))failureBlock
{
    self.chatRoomMessageDelegate = nil;
    [[RCIMClient sharedRCIMClient] quitChatRoom:roomId
                                        success:^{
                                            if (successBlock) {
                                                successBlock();
                                            }
                                        } error:^(RCErrorCode status) {
                                            if (failureBlock) {
                                                failureBlock();
                                            }
                                        }];
}

#pragma mark - RCIMClientReceiveMessageDelegate

- (void)onReceived:(RCMessage *)message left:(int)nLeft object:(id)object
{
    RCMessageContent *contentMessage = message.content;
    if ([contentMessage isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)contentMessage;
        
        NSString *extra = textMessage.extra;
        NSString *contentJson = textMessage.content;
        
        NSLog(@"消息type ---%@---",extra);
        NSLog(@"消息体 -------%@",contentJson);

        NSData *jsonData = [contentJson dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *error = nil;
        id content = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingAllowFragments
                                                       error:&error];
        if (!error
            && content
            && [content isKindOfClass:[NSDictionary class]]) {
            if (self.chatRoomMessageDelegate
                && [self.chatRoomMessageDelegate respondsToSelector:@selector(BBLiveChatRoomMessageDidReceivedWithMessageType:messageDic:)]) {
                [self.chatRoomMessageDelegate BBLiveChatRoomMessageDidReceivedWithMessageType:extra messageDic:content];
            }
        }

        
    }
}

#pragma mark - RCConnectionStatusChangeDelegate

- (void)onConnectionStatusChanged:(RCConnectionStatus)status
{
    
}

#pragma mark - RCChatRoomStatusDelegate

- (void)onChatRoomJoining:(NSString *)chatroomId
{
    
}

- (void)onChatRoomJoined:(NSString *)chatroomId
{
    
}

- (void)onChatRoomJoinFailed:(NSString *)chatroomId errorCode:(RCErrorCode)errorCode
{
    
}

- (void)onChatRoomQuited:(NSString *)chatroomId
{
    
}

@end
