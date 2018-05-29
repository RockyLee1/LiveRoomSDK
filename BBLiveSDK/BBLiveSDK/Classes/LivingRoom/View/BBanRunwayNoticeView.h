//
//  BBanRunwayNoticeView.h
//  BanBanLive
//
//  Created by linzuhan on 2018/5/11.
//  Copyright © 2018年 伴伴网络. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBanRunwayNoticeView : UIView

- (instancetype)initWithNoticeIcon:(UIImage *)noticeIcon
            contentBackgroundColor:(UIColor *)color;

- (void)addRunwayNoticeWithDic:(NSDictionary *)dic;

@end
