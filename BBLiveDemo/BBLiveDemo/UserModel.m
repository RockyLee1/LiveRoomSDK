//
//  UserModel.m
//  BBLiveDemo
//
//  Created by linzuhan on 2018/5/16.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (instancetype)shareModel
{
    static UserModel *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[self alloc] init];
    });
    
    return model;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
