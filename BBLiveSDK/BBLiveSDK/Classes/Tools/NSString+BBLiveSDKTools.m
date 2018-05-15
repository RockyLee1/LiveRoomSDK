//
//  NSString+BBLiveSDKTools.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/15.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "NSString+BBLiveSDKTools.h"
#include <CommonCrypto/CommonCrypto.h>

@implementation NSData (BBLiveSDKTools)

- (NSString *)md5String
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end

@implementation NSString (BBLiveSDKTools)

- (NSString *)MD5String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5String];
}

@end
