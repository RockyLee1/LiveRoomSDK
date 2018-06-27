//
//  BBLiveRoomHandle.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/8.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveRoomHandle.h"
#import "BBLiveRoomViewController.h"

#import "BBLiveAnchorRoomViewController.h"

@implementation BBLiveRoomHandle

+ (UIViewController *)liveRoomWithRoomURL:(NSString *)url
{
    BBLiveRoomViewController *liveRoomVC = [[BBLiveRoomViewController alloc] initWithNibName:@"BBLiveSDKResource.bundle/BBLiveRoomViewController" bundle:nil];
//    liveRoomVC.livingRoomURLString = url;
    
    return liveRoomVC;
}

+ (UIViewController *)liveRoomWithListRoomInfo:(BBLiveListRoomInfoModel *)roomInfo
{
    BBLiveRoomViewController *liveRoomVC = [[BBLiveRoomViewController alloc] initWithNibName:@"BBLiveSDKResource.bundle/BBLiveRoomViewController" bundle:nil];
    liveRoomVC.roomInfoModel = roomInfo;
    
    return liveRoomVC;
}

+ (UIViewController *)openLive
{
    BBLiveAnchorRoomViewController *anchorRoomVC = [[BBLiveAnchorRoomViewController alloc] initWithNibName:@"BBLiveSDKResource.bundle/BBLiveAnchorRoomViewController" bundle:nil];
    
    return anchorRoomVC;
}


@end
