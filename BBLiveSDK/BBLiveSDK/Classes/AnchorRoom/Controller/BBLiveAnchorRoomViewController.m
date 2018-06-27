//
//  BBLiveAnchorRoomViewController.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/29.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveAnchorRoomViewController.h"

#import "BBLiveRoomTopViewController.h"
#import "BBLiveRoomBottomViewController.h"
#import "BBLiveRoomMessageViewController.h"

#import <Masonry/Masonry.h>
#import <libextobjc/EXTScope.h>

#import "BBLiveAnchorRoom.h"
#import "BBLiveStreamingSession.h"

@interface BBLiveAnchorRoomViewController ()

// UI
@property (weak, nonatomic) IBOutlet UIView *playerContentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *topContentView;
@property (weak, nonatomic) IBOutlet UIView *bottomContentView;
@property (weak, nonatomic) IBOutlet UIView *messageTableViewContentView;

@property (strong, nonatomic) BBLiveRoomTopViewController *topViewController;
@property (strong, nonatomic) BBLiveRoomMessageViewController *messageTableViewController;
@property (strong, nonatomic) BBLiveRoomBottomViewController *bottomViewController;

@property (nonatomic, strong) BBLiveAnchorRoom *anchorRoom;
@property (nonatomic, strong) BBLiveStreamingSession *streamingSession;

@end

@implementation BBLiveAnchorRoomViewController

- (IBAction)backBtnClicked:(UIButton *)sender
{    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.streamingSession = [[BBLiveStreamingSession alloc] init];
    UIView *preview = [self.streamingSession livePreview];
    if (preview) {
        [self.playerContentView addSubview:preview];
        [preview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
