//
//  BBLiveRoomViewController.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/8.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveRoomViewController.h"
#import <PLPlayerKit/PLPlayerKit.h>

#import "BBLiveRoomTopViewController.h"
#import "BBLiveRoomBottomViewController.h"

#import <Masonry/Masonry.h>

@interface BBLiveRoomViewController ()

@property (weak, nonatomic) IBOutlet UIView *playerContentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *topContentView;
@property (weak, nonatomic) IBOutlet UIView *bottomContentView;

@property (strong, nonatomic) PLPlayer *player;

@property (strong, nonatomic) BBLiveRoomTopViewController *topViewController;
@property (strong, nonatomic) BBLiveRoomBottomViewController *bottomViewController;

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
    [self.liveUserRoom setEnterLiveRoomCompleteBlock:^{
        
    }];
    
    PLPlayerOption *playerOption = [PLPlayerOption defaultOption];
    
    NSString *url = self.livingRoomURLString;
    
    self.player = [PLPlayer playerLiveWithURL:[NSURL URLWithString:url]
                                       option:playerOption];
    self.player.playerView.contentMode = UIViewContentModeScaleAspectFit;
    self.player.playerView.frame = [UIScreen mainScreen].bounds;
    [self.player play];
    
    [self.playerContentView addSubview:self.player.playerView];
    
    
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

@end
