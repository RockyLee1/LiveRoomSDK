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
#import "BBLiveRoomMessageViewController.h"

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
@property (weak, nonatomic) IBOutlet UIView *messageTableViewContentView;

@property (strong, nonatomic) BBLiveRoomTopViewController *topViewController;
@property (strong, nonatomic) BBLiveRoomMessageViewController *messageTableViewController;
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
    
    [self.messageTableViewContentView addSubview:self.messageTableViewController.view];
    [self.messageTableViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds), 0) animated:NO];
}

#pragma mark - Lazy Load

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

- (BBLiveRoomMessageViewController *)messageTableViewController
{
    if (!_messageTableViewController) {
        _messageTableViewController = [[BBLiveRoomMessageViewController alloc] initWithNibName:@"BBLiveSDKResource.bundle/BBLiveRoomMessageViewController" bundle:nil];
    }
    
    return _messageTableViewController;
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

- (void)liveRoomLiveMessageWithMessageType:(BBLiveRoomMessageType)messageType
                                messageDic:(NSDictionary *)messageDic
{
    NSString *string = [NSString stringWithFormat:@"消息Type(%zd),nickname = (%@)",messageType,messageDic[@"nickname"]];
    
    
    [self.messageTableViewController performSelector:@selector(addMessageWithMessage:) withObject:string afterDelay:0.3];
    
//    for (int i = 0; i<10; i++) {
//        [self.messageTableViewController addMessageWithMessage:string];
//    }
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
