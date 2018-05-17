//
//  LoginRequest.m
//  BBLiveDemo
//
//  Created by linzuhan on 2018/5/16.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "LoginRequest.h"
#import "NSString+BBLiveSDKTools.h"
#import "UserModel.h"

@implementation LoginRequest

- (BBLiveRequestMethod)requestMethod
{
    return BBLiveRequestMethodPost;
}

- (NSString *)requestPath
{
    return @"user/mobileLogin";
}

- (NSDictionary *)requestCustomParameters
{
    NSString *phoneNum = self.userName;
    NSString *pword = [self.password MD5String];
    NSString *mobileModel = @"iPhone 6";
    NSString *osVersion = @"iOS 11.2.6";
    NSString *version = @"2.0.5";
    
    return @{@"mobile":phoneNum,
             @"pword" :pword,
             @"mobileModel":mobileModel,
             @"osVersion":osVersion,
             @"version":version
             };
}

- (void)parseResponseWithResponseObject:(NSDictionary *)responseDic
{
    NSString *token = nil;
    NSString *uid = nil;
    if (responseDic && [responseDic isKindOfClass:[NSDictionary class]]) {
        token = [responseDic valueForKeyPath:@"data.token"];
        uid = [responseDic valueForKeyPath:@"data.uid"];
    }
    
    [UserModel shareModel].token = token;
    [UserModel shareModel].uid = uid;
}

//[BBanAccountManager loginWithParams:@{@"mobile":phoneNumber,
//                                      @"pword" :[BBanSecurity md5:password],
//                                      @"mobileModel":[CommonTools deviceVersion],
//                                      @"osVersion":[CommonTools osVersion],
//                                      @"version":[CommonTools appVersion]
//                                      } success:^(id response) {
//
//                                          [self.presenter loginSuccess];
//                                          [MBManager hideAlert];
//
//                                      } failed:^(id error) {
//                                          [MBManager hideAlert];
//
//                                          [MBManager showBriefAlert:error];
//
//
//                                          [self.presenter loginFailed];
//
//                                      }];

@end
