//
//  BBLiveGiftModel.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/23.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef NS_ENUM(NSInteger, BBLiveGiftLeftMarkType) {
//    BBLiveGiftLeftMarkTypeUnknown = 0,
//    BBLiveGiftLeftMarkType,
//    BBLiveGiftLeftMarkType
//    BBLiveGiftLeftMarkType
//    BBLiveGiftLeftMarkType
//    BBLiveGiftLeftMarkType
//};

@interface BBLiveGiftModel : NSObject

@property (nonatomic, copy) NSString *gname;
@property (nonatomic, assign) NSInteger gsort;
@property (nonatomic, copy) NSString *gcover;
@property (nonatomic, copy) NSString *gframeurl;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger gprice;
@property (nonatomic, assign) NSInteger gtype;
@property (nonatomic, assign) NSInteger gver;
@property (nonatomic, assign) BOOL isshow;
@property (nonatomic, copy) NSString *gnumtype;
@property (nonatomic, assign) NSInteger subtype;
@property (nonatomic, assign) NSInteger gid;
@property (nonatomic, assign) NSInteger credit;

@end

//{
//    "gname": "666",   //礼物名称
//    "gsort": 209,  //礼物排序
//    "gcover": "http://image.91banban.com/cover_666.png",   //礼物封面
//    "gframeurl": "http://image.91banban.com/66666.svga",   //礼物动画文件url
//    "type": 2,   //=1 易耗品 2 房间内|背包 3时效道具
//    "gprice": 990,   //礼物价格
//    "gtype": 4,   //礼物类型  =1礼物消息连 =2动态图片(半屏 带离子效果) =3动画效果(半瓶 不带离子效果) =4动画全屏 =5半屏带文字效果'
//    "gver": 8,   //礼物版本
//    "isshow": 1,    //是否显示
//    "gnumtype": "0",    //礼物可先择数量
//    "subtype": 0,   //礼物类型(0=>普通礼物 1=>弹幕 2=>喇叭 3=>VIP 31=>VIP徽章 4=>贵族 5=>座驾 6=>徽章 7=>守护 71=>守护徽章 8=>商城道具
//    "gid": 192,
//    "credit": 594   //主播可得魅力值
//}
