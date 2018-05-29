//
//  BBLiveGiftRequest.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/23.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest.h"
#import "BBLiveGiftModel.h"

@interface BBLiveGiftRequest : BBLiveBaseRequest

@property (nonatomic, strong) NSArray <__kindof BBLiveGiftModel *>*giftList;


@end
