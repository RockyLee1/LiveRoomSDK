//
//  BBLiveRoomDetailInfoModel.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/16.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

/* 用户进入直播间拿到直播间的详细信息模块 */

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BBLiveUserSex) {
    BBLiveUserSexWomen = 0,
    BBLiveUserSexMan,
    BBLiveUserSexUnknown
};

@interface BBLiveRoomDetailInfoModel : NSObject

// 主播基本信息
@property (nonatomic, strong) NSString *anchorNikeName;
@property (nonatomic, assign) BBLiveUserSex anchorSex;
@property (nonatomic, strong) NSString *anchorHeadImg;
@property (nonatomic, assign) NSInteger anchorUid;
@property (nonatomic, assign) NSInteger creditTotal; // 主播魅力值
@property (nonatomic, assign) NSInteger anchorEx;
@property (nonatomic, assign) NSInteger anchorNextEx;
@property (nonatomic, assign) NSInteger anchorLevel;
@property (nonatomic, assign) NSInteger ranking;

// 用户基本信息
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, assign) BOOL isFollow;
@property (nonatomic, assign) NSInteger userLevel;
@property (nonatomic, assign) BOOL roomManage;
@property (nonatomic, assign) NSInteger carId;



//anchorEx = 2435610;
//anchorHeadImg = "http://out8i00tg.bkt.clouddn.com/FufJOybv6-0m2Rkky0A0xCx_Gc-H?imageMogr2/thumbnail/250x250&v=1524623294";
//anchorLevel = 12;
//anchorNextEx = 2500000;
//anchorNikeName = "\U5357\U6765\U5317\U5f80";
//anchorSex = 1;
//anchorUid = 77884;
//carId = 0;
//creditTotal = 4660510;
//data =         (
//);
//fire = 230930;
//isBanned = 0;
//isFollow = 0;
//plate = 0;
//prompt = "\U82f9\U679c\U7528\U6237\U5145\U503c\U3001\U63d0\U73b0\Uff0c\U8bf7\U524d\U5f80\U5fae\U4fe1\U516c\U4f17\U53f7";
//ranking = 1;
//roomManage = 1;
//uid = 80016;
//userLevel = 14;

@end
