//
//  UserModel.h
//  BBLiveDemo
//
//  Created by linzuhan on 2018/5/16.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *uid;

+ (instancetype)shareModel;


@end
