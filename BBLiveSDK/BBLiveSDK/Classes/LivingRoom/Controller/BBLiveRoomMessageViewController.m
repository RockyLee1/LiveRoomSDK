//
//  BBLiveRoomMessageViewController.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/22.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveRoomMessageViewController.h"

@interface BBLiveRoomMessageViewController ()<
UITableViewDelegate,
UITableViewDataSource
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *messageList;
@property (strong, nonatomic) NSMutableArray *messageCacheList;

@property (assign, nonatomic) BOOL isRoomBottom;        // 是否是在底部了
@property (assign, nonatomic) BOOL isDraging;           //
@property (assign, nonatomic) BOOL isTableViewBusying;  // 消息列表是否在插入

@end

@implementation BBLiveRoomMessageViewController

- (NSMutableArray *)messageList
{
    if (!_messageList) {
        _messageList = [NSMutableArray array];
    }
    
    return _messageList;
}

- (NSMutableArray *)messageCacheList
{
    if (!_messageCacheList) {
        _messageCacheList = [NSMutableArray array];
    }
    
    return _messageCacheList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isRoomBottom = YES;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -

- (void)addMessageWithMessage:(NSString *)msg
{
    if (!self.isTableViewBusying) {
        self.isTableViewBusying = YES;
        
        [self insertRowsWithMsg:msg
                  completeBlock:^{
                      self.isTableViewBusying = NO;
                      
                      NSString *tmp = [self.messageCacheList firstObject];
                      if (tmp) {
                          [self.messageCacheList removeObjectAtIndex:0];
                          
                          [self addMessageWithMessage:tmp];
                      }
                  }];
    } else {
        [self.messageCacheList addObject:msg];
    }
}

- (void)insertRowsWithMsg:(NSString *)msg
            completeBlock:(void (^)(void))completeBlock
{
    [self.messageList addObject:msg];

    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.messageList.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
        
    if (self.isRoomBottom) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.messageList.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completeBlock) {
            completeBlock();
        }
    });
    
//    [self.tableView performBatchUpdates:^{
//        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.list.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
//    } completion:^(BOOL finished) {
//        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.list.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
//
//        if (completeBlock) {
//            completeBlock();
//        }
//    }];
}

- (IBAction)addOne:(UIButton *)sender
{
//    NSString *str = [NSString stringWithFormat:@"第%zd行...",self.list.count + 1];
//    [self.list addObject:str];
//
//    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.list.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.list.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
//    [self.tableView reloadData];
}

- (IBAction)autoAdd:(UIButton *)sender
{
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self addOne:nil];
    }];
}

- (IBAction)stopAdd:(UIButton *)sender
{
    
}

- (IBAction)fastAdd:(UIButton *)sender
{
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.isDraging = YES;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.isDraging = NO;
    
    NSArray *visibleIndexPaths = [self.tableView indexPathsForVisibleRows];
    NSInteger numberRows = [self.tableView numberOfRowsInSection:0];
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:numberRows - 1 inSection:0];
    if ([visibleIndexPaths containsObject:lastIndexPath]) {
        self.isRoomBottom = YES;
    } else {
        self.isRoomBottom = NO;
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{

}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSArray *visibleIndexPaths = [self.tableView indexPathsForVisibleRows];
    NSInteger numberRows = [self.tableView numberOfRowsInSection:0];
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:numberRows - 1 inSection:0];
    if ([visibleIndexPaths containsObject:lastIndexPath]) {
        self.isRoomBottom = YES;
    } else {
        self.isRoomBottom = NO;
    }
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.messageList objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13.f];
    cell.textLabel.textColor = [[self class] randomColor];
    
    return cell;
}

+ (UIColor *)randomColor {
    //detail implementation
    //arc4random() % 78 will return a number between 0 and 77, for example.
    CGFloat hue = arc4random() % 100 / 100.0; //色调：0.0 ~ 1.0
    CGFloat saturation = (arc4random() % 50 / 100) + 0.5; //饱和度：0.5 ~ 1.0
    CGFloat brightness = (arc4random() % 50 / 100) + 0.5; //亮度：0.5 ~ 1.0
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
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
