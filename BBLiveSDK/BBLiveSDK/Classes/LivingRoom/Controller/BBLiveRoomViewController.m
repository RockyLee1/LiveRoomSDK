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

@interface BBLiveRoomViewController ()<BBLiveUserRoomDelegate>

// UI
@property (weak, nonatomic) IBOutlet UIView *playerContentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *topContentView;
@property (weak, nonatomic) IBOutlet UIView *bottomContentView;

@property (strong, nonatomic) BBLiveRoomTopViewController *topViewController;
@property (strong, nonatomic) BBLiveRoomBottomViewController *bottomViewController;

// DATA
@property (strong, nonatomic) BBLivePlayer *livePlayer;
@property (nonatomic, strong) BBLiveUserRoom *liveUserRoom;

@end

@implementation BBLiveRoomViewController

- (void)dealloc
{
    
}

- (IBAction)backBtnClicked:(UIButton *)sender
{
    [self.liveUserRoom leaveLiveUserRoom];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    [self enterLiveUserRoom];
}

- (void)enterLiveUserRoom
{
    self.liveUserRoom = [[BBLiveUserRoom alloc] initLiveUserRoomWithInfo:self.roomInfoModel];
    self.liveUserRoom.delegate = self;
    [self.liveUserRoom enterLiveUserRoom];
}

- (void)setupUI
{
    //
    self.livePlayer = [BBLivePlayer livePlayerWithUrl:self.roomInfoModel.livingURL
                                    playerContentView:self.playerContentView];
    [self.livePlayer play];
    
    [self.topContentView addSubview:self.topViewController.view];
    [self.topViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    [self.bottomContentView addSubview:self.bottomViewController.view];
    [self.bottomViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds), 0) animated:NO];
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

#pragma mark - BBLiveUserRoomDelegate

- (void)liveRoomEnterCompleteWithDetailInfoModel:(BBLiveRoomDetailInfoModel *)detailInfoModel
{
    [self.topViewController refreshTopViewWithLiveRoomDetailInfoModel:self.liveUserRoom.roomDetailInfo];
}

- (void)liveRoomAudienceListRequestCompleteWithAudienceList:(NSArray<__kindof BBLiveAudienceModel *> *)audienceList
{
    [self.topViewController refreshAudienceCollectionViewWithList:self.liveUserRoom.audienceList];
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
