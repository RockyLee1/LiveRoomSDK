//
//  BBLivePlayer.h
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/17.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBLivePlayer : NSObject

+ (BBLivePlayer *)livePlayerWithUrl:(NSString *)url
                  playerContentView:(UIView *)playerContentView;

- (instancetype)initLivePlayerWithURLString:(NSString *)urlString
                          playerContentView:(UIView *)playerContentView;
- (void)play;
- (void)pause;
- (void)stop;

@end
