//
//  HotCircleViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HotCircleViewController.h"
#import "CircleModel.h"
#import "HotCircleView.h"
#import "AboutCircleViewController.h"

#import "UIUtils.h"
#import "RequestUtils.h"

#define kMessageSize @"20"

@interface HotCircleViewController ()
{
    __block NSString *indexString;
}
@property(nonatomic,strong)HotCircleView *hotCircleView;

@property(nonatomic,copy)NSMutableArray *hotCircleModels;

@property(nonatomic,strong)NSNumber *totalCount;

@property(nonatomic,strong)NSNumber *totalPageCount;

@end

@implementation HotCircleViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationHotCircleViewDidSelectedRow object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _hotCircleModels = [[NSMutableArray alloc] init];
    
    //第一页数据
    indexString = @"1";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableViewDidSelectedRowNotification:) name:kNotificationHotCircleViewDidSelectedRow object:nil];
    self.homeView.navigationView.navigationTitle = @"热门圈子";
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.homeView.navigationView.leftButton = backButton;
    
    __weak __typeof(&*self)weakSelf = self;
    _hotCircleView = [[HotCircleView alloc] initWithFrame:self.homeView.contentView.bounds andHeaderRefreshBlock:^{
        
    } FooterRefreshBlock:^{
        NSInteger i = [indexString integerValue];
        indexString = [NSString stringWithFormat:@"%ld",++i];
        [weakSelf doRefresh];
    }];
    
    [self.homeView.contentView addSubview:_hotCircleView];
    [self doRequest];
    
}

-(void)doRefresh{
    if ([indexString integerValue]>[self.totalPageCount integerValue]) {
        [_hotCircleView endRefreshing];
        NSInteger i = [indexString integerValue];
        indexString = [NSString stringWithFormat:@"%ld",--i];
    }else{
        [self doRequest];
    }
}

-(void)doRequest{
    NSString *token = [UIUtils getToken];
    RequestUtils *request = [[RequestUtils alloc] init];
    [request doGetHttpRequestWithParameters:@{@"token":token,@"size":kMessageSize,@"index":indexString}
                                     andURL:@"exten/group_list.json"
                                 andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                                     [self fillData:responseObject];
                                     [_hotCircleView endRefreshing];
                                 } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                     
                                 }];
    
    
}

-(NSNumber *)totalPageCount{
    NSInteger totalCount = [_totalCount integerValue];
    
    NSInteger totalPage = (totalCount + [kMessageSize integerValue] -1)/[kMessageSize integerValue];
    
    return [NSNumber numberWithInteger:totalPage];
}

-(void)fillData:(id)responseObject{
    _totalCount = [responseObject objectForKey:@"total_count"];
    indexString = [responseObject objectForKey:@"curr_index"];
    NSArray *dicts = [responseObject objectForKey:@"obj"];
    
    for (NSDictionary *dict in dicts) {
        CircleModel *model = [CircleModel circleModelWithHotCircleDictionary:dict];
        [_hotCircleModels addObject:model];
    }
    _hotCircleView.circleModels = _hotCircleModels;
}

-(void)tableViewDidSelectedRowNotification:(NSNotification *)notification{
    //NSIndexPath *indexPath = [notification.userInfo objectForKey:@"indexPath"];
    AboutCircleViewController *vc = [[AboutCircleViewController alloc] init];
//    [self presentModalViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:^{

    }];
    //用来唤醒主线程，调用一个空方法。不然，当需要弹出模态控制器时候，会卡住
    [self performSelector:@selector(doNothing) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
}

-(void)doNothing{}

-(void)backButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}




@end
