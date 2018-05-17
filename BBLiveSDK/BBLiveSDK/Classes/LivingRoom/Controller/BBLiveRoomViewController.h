//
//  BBLiveRoomViewController.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/8.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBLiveUserRoom.h"

@interface BBLiveRoomViewController : UIViewController

@property (nonatomic, strong) BBLiveUserRoom *liveUserRoom;

@property (nonatomic, strong) NSString *livingRoomURLString;

@end
