//
//  UIImage+LoadSDKResource.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/17.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define BBLiveImage(name) [UIImage BBLiveImageWithName:name]

@interface UIImage (LoadSDKResource)

+ (UIImage *)BBLiveImageWithName:(NSString *)name;

@end
