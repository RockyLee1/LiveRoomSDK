//
//  BBLiveRoomTopViewController.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/11.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveRoomTopViewController.h"
#import "BBLiveRoomDetailInfoModel.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface BBLiveRoomTopViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *anchorAvatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *anchorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *experienceLabel;
@property (weak, nonatomic) IBOutlet UIButton *attentionBtn;

@property (weak, nonatomic) IBOutlet UIImageView *hotIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *hotValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *charmValueLabel;

@end

@implementation BBLiveRoomTopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshTopViewWithLiveRoomDetailInfoModel:(BBLiveRoomDetailInfoModel *)model
{
    self.anchorNameLabel.text = model.anchorNikeName;
    [self.anchorAvatarImageView sd_setImageWithURL:[NSURL URLWithString:model.anchorHeadImg]];
    
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
