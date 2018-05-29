//
//  BBanRunwayNoticeView.m
//  BanBanLive
//
//  Created by linzuhan on 2018/5/11.
//  Copyright © 2018年 伴伴网络. All rights reserved.
//

#import "BBanRunwayNoticeView.h"

#import <Foundation/Foundation.h>
#import <Masonry/Masonry.h>

//#import "BBanGiftInfoModel.h"
//#import "BBanGiftNewManager.h"

@interface BBanRunwayNoticeView ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIImageView *noticeIconImageView;
@property (nonatomic, strong) UIView *noticeContentView;
@property (nonatomic, strong) UILabel *noticeLabel;

@property (nonatomic, assign) BOOL isContentViewDidShow;
@property (nonatomic, assign) BOOL isNoticeLabelRolling;
@property (nonatomic, strong) NSMutableArray *noticePoolArray;

@property (nonatomic, strong) UIImage *noticeIcon;
@property (nonatomic, strong) UIColor *contentBackgroundColor;

@end

@implementation BBanRunwayNoticeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initCustom];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initCustom];
    }
    return self;
}

- (instancetype)initWithNoticeIcon:(UIImage *)noticeIcon
            contentBackgroundColor:(UIColor *)color
{
    self = [super init];
    if (self) {
        _noticeIcon = noticeIcon;
        _contentBackgroundColor = color;
        
        [self initCustom];
    }
    
    return self;
}

- (void)initCustom
{
    self.hidden = YES;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = _contentBackgroundColor;
    self.contentView.layer.cornerRadius = 10.f;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(self.mas_right);
        make.bottom.equalTo(@0);
        make.width.equalTo(self);
    }];
    
    self.noticeIconImageView = [[UIImageView alloc] init];
    self.noticeIconImageView.backgroundColor = [UIColor clearColor];
    self.noticeIconImageView.image = _noticeIcon;
    [self.contentView addSubview:self.noticeIconImageView];
    [self.noticeIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.width.height.equalTo(@13);
        make.top.equalTo(@3.5);
    }];
    
    self.noticeContentView = [[UIView alloc] init];
    self.noticeContentView.clipsToBounds = YES;
    self.noticeContentView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.noticeContentView];
    [self.noticeContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@33);
        make.right.equalTo(@-10);
        make.bottom.equalTo(@0);
    }];
    
    // noticeLabel 不使用约束布局
    self.noticeLabel = [[UILabel alloc] init];
    self.noticeLabel.backgroundColor = [UIColor clearColor];
    self.noticeLabel.frame = CGRectMake(0, 0, 300, 20);
    [self.noticeContentView addSubview:self.noticeLabel];
}

- (NSMutableArray *)noticePoolArray
{
    if (!_noticePoolArray) {
        _noticePoolArray = [NSMutableArray array];
    }
    
    return _noticePoolArray;
}

#pragma mark - Helper

- (NSAttributedString *)noticeLabelAttributeStringWithDic:(NSDictionary *)dic
{
    return nil;
//    NSMutableAttributedString *colorStr = [[NSMutableAttributedString alloc] init];
//    NSArray *arr = dic[@"data"];
//
//    for (NSDictionary *obj in arr) {
//        if ([obj[@"name"] length] > 0) {
//            NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:obj[@"name"] attributes:@{NSFontAttributeName:T_FONT(14),NSForegroundColorAttributeName:[UIColor colorWithHexString:obj[@"color"]]}];
//            [colorStr appendAttributedString:attribute];
//        }
//        if ([obj[@"gid"] intValue] > 0) {
//
//            NSTextAttachment *textAttach = [[NSTextAttachment alloc] init];
//            CGFloat centY = (T_FONT(14).lineHeight - T_FONT(14).pointSize) / 2;
//            textAttach.bounds = CGRectMake(0, -centY - .5, 16, 14);
//
//            NSArray *giftListArr = [BBanGiftNewManager defaultManager].totalGiftArr;
//            BBanGiftInfoModel *giftModel = nil;
//            for (BBanGiftInfoModel *objModel in giftListArr) {
//                if(objModel.gid == [obj[@"gid"] intValue])
//                {
//                    giftModel = objModel;
//                };
//            }
//
//            NSString *giftImageKey = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:giftModel.gcover]];
//            UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:giftImageKey];
//            if (image) {
//                textAttach.image = image;
//            }else
//            {
//                image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:giftModel.gcover]]];
//            }
//
//            NSAttributedString *imgAtt = [NSAttributedString attributedStringWithAttachment:textAttach];
//            [colorStr appendAttributedString:imgAtt];
//        }
//    }
//
//    return colorStr;
}

#pragma mark -

- (void)addRunwayNoticeWithDic:(NSDictionary *)dic
{
    // 解析数据
    NSAttributedString *noticeString = [self noticeLabelAttributeStringWithDic:dic];
    
    if (!self.isContentViewDidShow) {
        self.hidden = NO;
        
        [self showContentViewWithCompleteBlock:^{
            self.isContentViewDidShow = YES;

            [self showNoticeLabelWithNoticeString:noticeString];
        }];
    } else {
        [self showNoticeLabelWithNoticeString:noticeString];
    }
}

- (void)showNoticeLabelWithNoticeString:(NSAttributedString *)noticeString
{
    if (!self.isNoticeLabelRolling) {
        self.isNoticeLabelRolling = YES;
        
        [self rollRunNoticeLabelWithNoticeString:noticeString
                                   completeBlock:^{
                                       self.isNoticeLabelRolling = NO;
                                       
                                       NSAttributedString *firstString = [self.noticePoolArray firstObject];
                                       [self.noticePoolArray removeObjectAtIndex:0];
                                       
                                       if (firstString.length > 0) {
                                           [self showNoticeLabelWithNoticeString:firstString];
                                       } else {
                                           // 结束递归
                                           [self hideContentViewWithCompleteBlock:^{
                                               self.isContentViewDidShow = NO;
                                               self.hidden = YES;
                                               
                                               // 复原界面
                                               [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
                                                   make.top.equalTo(@0);
                                                   make.left.equalTo(self.mas_right);
                                                   make.bottom.equalTo(@0);
                                                   make.width.equalTo(self);
                                               }];

                                               
                                               // 之后可以移除这个界面
                                           }];
                                       }
                                   }];
    } else {
        // 如果正在滚动，加到滚动池子里，等待下一次展示
        [self.noticePoolArray addObject:noticeString];
    }
}

- (void)rollRunNoticeLabelWithNoticeString:(NSAttributedString *)noticeString
                             completeBlock:(void (^)(void))completeBlock
{
    self.noticeLabel.attributedText = noticeString;
    [self.noticeLabel sizeToFit];
    
    self.noticeLabel.frame = CGRectMake(CGRectGetWidth(self.noticeContentView.bounds),
                                        1,
                                        CGRectGetWidth(self.noticeLabel.bounds),
                                        CGRectGetHeight(self.noticeLabel.bounds));
    
    CGFloat rollDistance = CGRectGetWidth(self.noticeLabel.bounds) + CGRectGetWidth(self.noticeContentView.bounds);
    CGFloat speed = 100.f;
    
    NSTimeInterval interval = rollDistance / speed;
    
    [UIView animateWithDuration:interval
                          delay:0.f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGRect tempRect = self.noticeLabel.frame;
                         tempRect.origin.x = -CGRectGetWidth(self.noticeLabel.bounds);
                         self.noticeLabel.frame = tempRect;
                     } completion:^(BOOL finished) {
                         if (completeBlock) {
                             completeBlock();
                         }
                     }];
}

- (void)hideContentViewWithCompleteBlock:(void (^)(void))completeBlock
{
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(-CGRectGetWidth(self.bounds)));
    }];
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         [self layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         if (completeBlock) {
                            completeBlock();
                         }
                     }];
}

- (void)showContentViewWithCompleteBlock:(void (^)(void))completeBlock
{
    self.hidden = NO;
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (finished) {
            if (completeBlock) {
                completeBlock();
            }
        }
    }];
}

@end
