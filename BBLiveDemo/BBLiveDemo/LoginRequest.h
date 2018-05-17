//
//  LoginRequest.h
//  BBLiveDemo
//
//  Created by linzuhan on 2018/5/16.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest.h"

@interface LoginRequest : BBLiveBaseRequest

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;

@end
