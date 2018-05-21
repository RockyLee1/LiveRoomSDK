//
//  BBLiveRoomAudienceListRequest.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/17.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest.h"

@class BBLiveAudienceModel;

@interface BBLiveRoomAudienceListRequest : BBLiveBaseRequest

@property (nonatomic, assign) NSInteger anchorUid;

@property (nonatomic, strong) NSArray <__kindof BBLiveAudienceModel *>*audienceList;

@end
