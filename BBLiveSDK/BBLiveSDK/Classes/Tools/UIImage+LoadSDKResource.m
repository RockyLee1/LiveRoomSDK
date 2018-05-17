//
//  UIImage+LoadSDKResource.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/17.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "UIImage+LoadSDKResource.h"

@implementation UIImage (LoadSDKResource)

+ (NSBundle *)BBLiveSDKResourceBundle
{
    static NSBundle *bundle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"BBLiveSDKResource" withExtension:@"bundle"]];
    });
    
    return bundle;
}

+ (UIImage *)BBLiveImageWithName:(NSString *)name
{
    return [UIImage imageNamed:name inBundle:[self BBLiveSDKResourceBundle] compatibleWithTraitCollection:nil];
}

@end
