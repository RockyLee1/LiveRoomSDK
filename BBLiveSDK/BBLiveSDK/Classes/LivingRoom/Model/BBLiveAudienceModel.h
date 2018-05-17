//
//  BBLiveAudienceModel.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/17.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

/* 主播房间观众模块 */

#import <Foundation/Foundation.h>

@interface BBLiveAudienceModel : NSObject

@property (nonatomic, copy) NSString *headImage;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, assign) NSInteger isRobot;
@property (nonatomic, assign) NSInteger userLevel;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, assign) NSInteger sort;

@end
