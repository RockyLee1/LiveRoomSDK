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

#import "UserModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) BBLivingListRequest *listRequest;


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
    
    if ([UserModel shareModel].token.length > 0) {
        liveConfig.token = [UserModel shareModel].token;
    }
    
    [[BBLiveManager shareLiveManager] configLiveManagerWithConfig:liveConfig];
    
    [[BBLiveManager shareLiveManager] configLiveRequestFetchCommonParamsBlock:^NSDictionary *{
        return @{};
    }];
}

- (IBAction)requestList:(UIButton *)sender
{
    self.listRequest = [[BBLivingListRequest alloc] init];
    [self.listRequest startRequestWithCompleteBlockWithSuccess:^(__kindof BBLiveBaseRequest *request) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
        
    } failure:^(__kindof BBLiveBaseRequest *request) {
        
    }];
}

- (IBAction)enterLiveRoomBtnClicked:(UIButton *)sender
{
    UIViewController *room = [BBLiveRoomHandle liveRoomWithRoomURL:nil];
    
    [self presentViewController:room animated:YES completion:^{
        
    }];
}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listRequest.list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LivingCellIdentifier" forIndexPath:indexPath];
    
    UIImageView *imageView = [cell.contentView viewWithTag:100];
    UILabel *label = [cell.contentView viewWithTag:101];
    
    BBLivingModel *model = [self.listRequest.list objectAtIndex:indexPath.item];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.livingImg]];
    label.text = model.nickname;
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BBLivingModel *model = [self.listRequest.list objectAtIndex:indexPath.item];
    
    NSString *livingUrlString = model.domain;
    
    BBLiveListRoomInfoModel *roomInfoModel = [[BBLiveListRoomInfoModel alloc] init];
    roomInfoModel.roomId = model.uid;
    roomInfoModel.livingCoverImageURL = model.livingImg;
    roomInfoModel.livingURL = model.domain;
    
    
//    UIViewController *livingRoom = [BBLiveRoomHandle liveRoomWithRoomURL:livingUrlString];
    
    UIViewController *livingRoom = [BBLiveRoomHandle liveRoomWithListRoomInfo:roomInfoModel];
    
    [self presentViewController:livingRoom animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
