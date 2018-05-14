//
//  ViewController.m
//  BBLiveDemo
//
//  Created by linzuhan on 2018/5/8.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "ViewController.h"
#import "BBLiveRoomHandle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
