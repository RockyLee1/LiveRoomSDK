//
//  BBLiveRoomViewController.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/8.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveRoomViewController.h"

#import "BBLiveRoomTopViewController.h"
#import "BBLiveRoomBottomViewController.h"

#import <Masonry/Masonry.h>
#import <libextobjc/EXTScope.h>

#import "BBLiveListRoomInfoModel.h"
#import "BBLivePlayer.h"

@interface BBLiveRoomViewController ()

// UI
@property (weak, nonatomic) IBOutlet UIView *playerContentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *topContentView;
@property (weak, nonatomic) IBOutlet UIView *bottomContentView;

@property (strong, nonatomic) BBLiveRoomTopViewController *topViewController;
@property (strong, nonatomic) BBLiveRoomBottomViewController *bottomViewController;

// DATA
@property (strong, nonatomic) BBLivePlayer *livePlayer;

@end

@implementation BBLiveRoomViewController

- (BBLiveUserRoom *)liveUserRoom
{
    if (!_liveUserRoom) {
        _liveUserRoom = [[BBLiveUserRoom alloc] init];
    }
    
    return _liveUserRoom;
}

- (IBAction)backBtnClicked:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.liveUserRoom enterLiveUserRoom];
    @weakify(self)
    [self.liveUserRoom setEnterLiveRoomCompleteBlock:^{
        @strongify(self)
        
        [self.topViewController refreshTopViewWithLiveRoomDetailInfoModel:self.liveUserRoom.roomDetailInfo];
        
    }];
    
    [self.liveUserRoom setLiveRoomAudienceRequestCompleteBlock:^{
        
    }];
    
    //
    self.livePlayer = [BBLivePlayer livePlayerWithUrl:self.liveUserRoom.roomInfo.livingURL
                                    playerContentView:self.playerContentView];
    [self.livePlayer play];
    
    [self.topContentView addSubview:self.topViewController.view];
    
    //
    [self.bottomContentView addSubview:self.bottomViewController.view];
    [self.bottomViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (BBLiveRoomTopViewController *)topViewController
{
    if (!_topViewController) {
        _topViewController = [[BBLiveRoomTopViewController alloc] initWithNibName:@"BBLiveSDKResource.bundle/BBLiveRoomTopViewController" bundle:nil];
    }
    
    return _topViewController;
}

- (BBLiveRoomBottomViewController *)bottomViewController
{
    if (!_bottomViewController) {
        _bottomViewController = [[BBLiveRoomBottomViewController alloc] initWithNibName:@"BBLiveSDKResource.bundle/BBLiveRoomBottomViewController" bundle:nil];
    }
    
    return _bottomViewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

@end
