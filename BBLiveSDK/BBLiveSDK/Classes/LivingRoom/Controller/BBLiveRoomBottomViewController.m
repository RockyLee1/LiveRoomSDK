//
//  BBLiveRoomBottomViewController.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/14.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveRoomBottomViewController.h"
#import "UIImage+LoadSDKResource.h"

@interface BBLiveRoomBottomViewController ()

@property (weak, nonatomic) IBOutlet UIView *inputContentView;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *giftBtn;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@end

@implementation BBLiveRoomBottomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //
    
    [self.playBtn setImage:BBLiveImage(@"live_room_wan_icon") forState:UIControlStateNormal];
    [self.giftBtn setImage:BBLiveImage(@"liwu") forState:UIControlStateNormal];
    [self.messageBtn setImage:BBLiveImage(@"sixin") forState:UIControlStateNormal];
    [self.shareBtn setImage:BBLiveImage(@"zhibojian_yonghu_fenxian") forState:UIControlStateNormal];
    [self.closeBtn setImage:BBLiveImage(@"guanbi") forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)inputCoverBtnClicked:(UIButton *)sender
{
    
}

- (IBAction)closeBtnClicked:(UIButton *)sender
{
    
}

- (IBAction)shareBtnClicked:(UIButton *)sender
{
    
}

- (IBAction)messageBtnClicked:(UIButton *)sender
{
    
}

- (IBAction)giftBtnClicked:(UIButton *)sender
{
    
}

- (IBAction)playBtnClicked:(UIButton *)sender
{
    
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
