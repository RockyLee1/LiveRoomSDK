//
//  BBLivingListRequest.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/15.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest.h"
#import "BBLivingModel.h"

@interface BBLivingListRequest : BBLiveBaseRequest

@property (nonatomic, strong) NSArray <__kindof BBLivingModel *>*list;

@end
