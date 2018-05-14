//
//  BBLiveBaseRequest.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/14.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BBLiveRequestMethod) {
    BBLiveRequestMethodGet = 0,
    BBLiveRequestMethodPost
};

@interface BBLiveBaseRequest : NSObject

- (BBLiveRequestMethod)requestMethod;

- (NSString *)baseURLString;

- (NSString *)requestPath;

- (NSDictionary *)requestParameters;

@end
