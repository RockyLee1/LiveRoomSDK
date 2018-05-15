//
//  BBLiveBaseRequest+Common.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/15.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

/* 根据业务模块需要覆盖的方法 */

#import "BBLiveBaseRequest.h"

@interface BBLiveBaseRequest (Common)

- (NSString *)baseURLString;
- (NSDictionary *)requestCommonParameters;

@end
