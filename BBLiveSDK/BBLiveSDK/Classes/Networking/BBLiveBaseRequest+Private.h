//
//  BBLiveBaseRequest+Private.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/15.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveBaseRequest.h"

@interface BBLiveBaseRequest (Private)

- (NSURL *)requestURL;
- (NSDictionary *)requestParameters;

@end
