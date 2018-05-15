//
//  ViewController.m
//  BBLiveDemo
//
//  Created by linzuhan on 2018/5/8.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "ViewController.h"

#import "BBLiveSDK.h"
#import "BBLivingListRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)initLiveBtnClicked:(UIButton *)sender
{
    
    
    

    BBLiveConfig *liveConfig = [[BBLiveConfig alloc] init];
    liveConfig.versionCode = @"10";
    liveConfig.os = @"2";
    liveConfig.token = @"ODAwMTZfOERCNzUzQzI4RTdGMTVEODVCNUQ3Mzg1QTQ3NUMzQUZfMl9EMzQwMDhBQy1BNzYyLTQyNjEtOEVDOS04QkIxRjZDNkNDM0VfMTUyNjM2ODU5NV9iYW5iYW4xMjM0NTY=";
    
    [[BBLiveManager shareLiveManager] configLiveManagerWithConfig:liveConfig];
    
    [[BBLiveManager shareLiveManager] configLiveRequestFetchCommonParamsBlock:^NSDictionary *{
        return @{};
    }];
}

- (IBAction)requestList:(UIButton *)sender
{
    BBLivingListRequest *request = [[BBLivingListRequest alloc] init];
    [request startRequest];
}

- (IBAction)enterLiveRoomBtnClicked:(UIButton *)sender
{
    UIViewController *room = [BBLiveRoomHandle liveRoomWithRoomURL:nil];
    
    [self presentViewController:room animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
