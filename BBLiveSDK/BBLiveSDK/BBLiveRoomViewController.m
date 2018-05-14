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

@interface BBLiveRoomViewController ()

@property (weak, nonatomic) IBOutlet UIView *playerContentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *topContentView;
@property (weak, nonatomic) IBOutlet UIView *bottomContentView;

@property (strong, nonatomic) PLPlayer *player;

@property (strong, nonatomic) BBLiveRoomTopViewController *topViewController;

@end

@implementation BBLiveRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PLPlayerOption *playerOption = [PLPlayerOption defaultOption];
    
    NSString *url = @"rtmp://pili-live-rtmp.91banban.cn/shanghaiyuemeng/91banbancntesting77712";
    
    self.player = [PLPlayer playerLiveWithURL:[NSURL URLWithString:url]
                                       option:playerOption];
    self.player.playerView.contentMode = UIViewContentModeScaleAspectFit;
    self.player.playerView.frame = [UIScreen mainScreen].bounds;
    [self.player play];
    
    [self.playerContentView addSubview:self.player.playerView];
    
    
    [self.topContentView addSubview:self.topViewController.view];
}

- (BBLiveRoomTopViewController *)topViewController
{
    if (!_topViewController) {
        _topViewController = [[BBLiveRoomTopViewController alloc] initWithNibName:@"BBLiveSDK.framework/BBLiveRoomTopViewController" bundle:nil];
    }
    
    return _topViewController;
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
