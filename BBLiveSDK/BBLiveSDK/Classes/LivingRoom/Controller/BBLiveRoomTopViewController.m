//
//  BBLiveRoomTopViewController.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/11.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveRoomTopViewController.h"
#import "BBLiveRoomDetailInfoModel.h"
#import "BBLiveAudienceModel.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

#import "UIImage+LoadSDKResource.h"

#define kAudienceCellIdentifier @"kAudienceCellIdentifier"

@interface BBLiveRoomTopViewController ()<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (weak, nonatomic) IBOutlet UIImageView *anchorAvatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *anchorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *experienceLabel;
@property (weak, nonatomic) IBOutlet UIButton *attentionBtn;

@property (weak, nonatomic) IBOutlet UIImageView *hotIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *hotValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *charmValueLabel;

@property (weak, nonatomic) IBOutlet UICollectionView *audienceCollectionView;

@property (strong, nonatomic) NSMutableArray *audienceList;

@end

@implementation BBLiveRoomTopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.audienceCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kAudienceCellIdentifier];
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

- (void)refreshAudienceCollectionViewWithList:(NSArray *)audienceList
{
    self.audienceList = [audienceList mutableCopy];
    
    [self.audienceCollectionView reloadData];
}

- (void)insertAudienceWithAudienceModel:(BBLiveAudienceModel *)audienceModel
{
//    [self.audienceCollectionView inser]
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.audienceList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAudienceCellIdentifier forIndexPath:indexPath];
    
    // 初始化
    UIImageView *audienceImageView = [cell.contentView viewWithTag:20180517];
    if (!audienceImageView) {
        audienceImageView = [[UIImageView alloc] init];
        audienceImageView.layer.cornerRadius = 16.f;
        audienceImageView.layer.masksToBounds = YES;
        audienceImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        audienceImageView.layer.borderWidth = 1.f;
        
        [cell.contentView addSubview:audienceImageView];
        [audienceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(@0);
        }];
    }
    
    // 赋值
    BBLiveAudienceModel *audienceModel = [self.audienceList objectAtIndex:indexPath.item];
    [audienceImageView sd_setImageWithURL:[NSURL URLWithString:audienceModel.avatar] placeholderImage:BBLiveImage(@"floorplan")];
  
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
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
