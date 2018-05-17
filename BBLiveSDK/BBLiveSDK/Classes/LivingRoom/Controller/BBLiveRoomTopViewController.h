//
//  BBLiveRoomTopViewController.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/11.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BBLiveRoomDetailInfoModel;

@interface BBLiveRoomTopViewController : UIViewController

- (void)refreshTopViewWithLiveRoomDetailInfoModel:(BBLiveRoomDetailInfoModel *)model;

- (void)refreshAudienceCollectionViewWithList:(NSArray *)audienceList;

@end
