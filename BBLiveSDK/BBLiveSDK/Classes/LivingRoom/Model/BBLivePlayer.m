//
//  BBLivePlayer.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/17.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLivePlayer.h"

#import <PLPlayerKit/PLPlayerKit.h>
#import <Masonry/Masonry.h>

@interface BBLivePlayer ()<PLPlayerDelegate>

@property (nonatomic, strong) PLPlayer *player;
@property (nonatomic, strong) NSString *playUrl;
@property (nonatomic, weak) UIView *playerContentView;

@end

@implementation BBLivePlayer

+ (BBLivePlayer *)livePlayerWithUrl:(NSString *)url
                  playerContentView:(UIView *)playerContentView
{
    BBLivePlayer *player = [[BBLivePlayer alloc] initLivePlayerWithURLString:url
                                                           playerContentView:playerContentView];
    return player;
}

- (instancetype)initLivePlayerWithURLString:(NSString *)urlString
                          playerContentView:(UIView *)playerContentView
{
    if (self = [super init]) {
        _playUrl = urlString;
        _playerContentView = playerContentView;
        
        [self setUpPlayer];
    }
    
    return self;
}

- (void)setUpPlayer
{
    PLPlayerOption *option = [PLPlayerOption defaultOption];
    
    self.player = [PLPlayer playerWithURL:[NSURL URLWithString:_playUrl] option:option];
    self.player.playerView.contentMode = UIViewContentModeScaleAspectFill;
    self.player.delegate = self;
    
    [self.playerContentView addSubview:self.player.playerView];

    [self.player.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(@0);
    }];
}

- (void)play
{
    [self.player play];
}

- (void)pause
{
    [self.player pause];
}

- (void)stop
{
    [self.player stop];
}

#pragma mark - PLPlayerDelegate



@end
