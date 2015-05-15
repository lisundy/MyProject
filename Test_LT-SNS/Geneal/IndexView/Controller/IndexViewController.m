//
//  IndexViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/8.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "IndexViewController.h"
#import "IndexTableView.h"
#import "LeShiDetailViewController.h"
#import "HuaTiViewController.h"
#import "RequestUtils.h"
#import "UIUtils.h"
#import "IndexCellModel.h"
#import "UIViewExt.h"


@interface IndexViewController ()<IndexTitleBtnDelegate>
{
    NSString    *index;
    BOOL        isMore;
    BOOL        showHUD;
}
@end

@implementation IndexViewController
@synthesize data;

- (instancetype)init
{
    self = [super init];
    if (self) {
        showHUD = YES;
        //加载首页数据
        _indexTableView.indexType = kAllIndexViewInfo;
        index = @"1";
        [self loadData:index];
    }
    return self;
}

//加载网络数据
- (void)loadData:(NSString *)num
{
    RequestUtils *request = [[RequestUtils alloc] init];
    
    NSString *token = [UIUtils getToken];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            token,@"token",
                            num,@"index",
                            SIZE,@"size",nil];
    
    if (showHUD) {
        [self showProgressHudInView:self.view animated:YES];
    }

    if ([_indexTableView.indexType isEqualToString: kAllIndexViewInfo]) {
        
        [request doGetHttpRequestWithParameters:params andURL:@"exten/search.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSString *code = [responseObject objectForKey:@"code"];
            if ([@"100" isEqualToString:code]) {
                [self hideProgressHudInView:self.view animated:YES];
                [_indexTableView stopRefreshing];
                [self hideProgressHudInView:self.view animated:YES];

                [self loadDataFinished:responseObject];
            }
        } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
    }
    
    if ([_indexTableView.indexType isEqualToString:kLeShiViewInfo]) {
        
        [request doGetHttpRequestWithParameters:params andURL:@"ls/search.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSString *code = [responseObject objectForKey:@"code"];
            
            if ([@"100" isEqualToString:code]) {
                
                [self hideProgressHudInView:self.view animated:YES];
                [_indexTableView stopRefreshing];
                [self hideProgressHudInView:self.view animated:YES];

                [self loadDataFinished:responseObject];
            }

        } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
    }
    
    if ([_indexTableView.indexType isEqualToString:kHuaTiViewInfo]) {
        
        [request doGetHttpRequestWithParameters:params andURL:@"ht/search.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSString *code = [responseObject objectForKey:@"code"];
            
            if ([@"100" isEqualToString:code]) {
                
                showHUD = NO;
                [_indexTableView stopRefreshing];
                [self hideProgressHudInView:self.view animated:YES];

                [self loadDataFinished:responseObject];
            }
            
        } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
    }
    
}

#pragma mark loadDataSuccess
- (void)loadDataFinished:(id)request
{
    NSArray *arrayData = [request objectForKey:@"obj"];
    
    NSMutableArray *tData = [[NSMutableArray alloc] initWithCapacity:arrayData.count];
    
    if ([_indexTableView.indexType isEqualToString:kAllIndexViewInfo]) {
        
        for (int i = 0; i < arrayData.count; i++) {
            
            NSDictionary *info = [arrayData objectAtIndex:i];
            IndexCellModel *indexModel = [[IndexCellModel alloc] initWithDataDic:info];
            [tData addObject:indexModel];
        }
    }
    
    if ([_indexTableView.indexType isEqualToString:kLeShiViewInfo]) {
        
        for (int i = 0; i < arrayData.count; i++) {
            
            NSDictionary *info = [arrayData objectAtIndex:i];
            LeShiViewModel *leshiModel = [[LeShiViewModel alloc] initWithDataDic:info];
            [tData addObject:leshiModel];
        }
    }
    
    if ([_indexTableView.indexType isEqualToString:kHuaTiViewInfo]) {
        
        for (int i = 0; i < arrayData.count; i++) {
            
            NSDictionary *info = [arrayData objectAtIndex:i];
            HuaTiViewModel *huatiModel = [[HuaTiViewModel alloc] initWithDataDic:info];
            [tData addObject:huatiModel];
        }
    }
    
    if (isMore) {
        //刷新了数据
        [data addObjectsFromArray:tData];
    }else{
        data = tData;
    }
    
    _indexTableView.data = data;
    [_indexTableView reloadData];
}

#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _indexTableView = [[IndexTableView alloc] initWithFrame:self.homeView.contentView.bounds];
    _indexTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _indexTableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    _indexTableView.currVC = self;
    
    __block typeof(self) weakSelf = self;
    //添加上下拉刷新
    [_indexTableView addRefreshWithHeaderRefreshBlock:^{

        [weakSelf downRefresh];
    } andFooterRefreshBlock:^{
        
        [weakSelf upRefresh];
    }];
    
    [self.homeView.contentView addSubview:_indexTableView];
    self.homeView.navigationView.navigationTitle = @"首页";
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
    
    UIButton *titleBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.homeView.navigationView.bounds.size.width - 200)/2, kStatusBarHeight, 200, self.homeView.navigationView.bounds.size.height)];
    [titleBtn addTarget:self action:@selector(chooseType:) forControlEvents:UIControlEventTouchUpInside];
    titleBtn.backgroundColor = [UIColor clearColor];
    [self.homeView.navigationView addSubview:titleBtn];
    
    isOpen = YES;
    typeChooseView = [[UIView alloc] initWithFrame:CGRectMake((self.homeView.navigationView.bounds.size.width - 100)/2, 0, 100, 90)];
    typeChooseView.hidden = YES;
    typeChooseView.backgroundColor = [UIColor orangeColor];
    [self.homeView.contentView addSubview:typeChooseView];
    
    //创建下拉视图-->用于信息类型选择
    [self createTypeChooseView];
}

#pragma mark 下拉刷
- (void)downRefresh
{
    index = @"1";
    showHUD = NO;
    isMore = NO;
    [self loadData:index];
}

#pragma mark 上拉刷新-旧数据
- (void)upRefresh
{
    isMore = YES;
    showHUD = NO;
    
    index = [NSString stringWithFormat:@"%i",[index intValue]+1];
    
    [self loadData:index];
}

//标题下拉视图创建
- (void)createTypeChooseView
{
    UIButton *indexBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, typeChooseView.bounds.size.width, typeChooseView.bounds.size.height/3 -1)];
    [indexBtn setTitle:@"所有信息" forState:UIControlStateNormal];
    [indexBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    indexBtn.backgroundColor = [UIColor clearColor];
    indexBtn.tag = 100;
    [indexBtn addTarget:self action:@selector(chooseType:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, indexBtn.bottom, typeChooseView.bounds.size.width, 0.3)];
    lineLabel.backgroundColor = [UIColor grayColor];
    [typeChooseView addSubview:indexBtn];
    [typeChooseView addSubview:lineLabel];
    
    UIButton *leshiBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, indexBtn.bottom + 1, typeChooseView.bounds.size.width, typeChooseView.bounds.size.height/3 -1)];
    [leshiBtn setTitle:@"乐事" forState:UIControlStateNormal];
    [leshiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    leshiBtn.backgroundColor = [UIColor clearColor];
    leshiBtn.tag = 101;
    [leshiBtn addTarget:self action:@selector(chooseType:) forControlEvents:UIControlEventTouchUpInside];
    lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, leshiBtn.bottom + 1, typeChooseView.bounds.size.width, 0.3)];
    lineLabel.backgroundColor = [UIColor grayColor];
    [typeChooseView addSubview:leshiBtn];
    [typeChooseView addSubview:lineLabel];
    
    UIButton *huatiBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, leshiBtn.bottom + 1, typeChooseView.bounds.size.width, typeChooseView.bounds.size.height/3 -1)];
    [huatiBtn setTitle:@"话题" forState:UIControlStateNormal];
    [huatiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    huatiBtn.backgroundColor = [UIColor clearColor];
    huatiBtn.tag = 102;
    [huatiBtn addTarget:self action:@selector(chooseType:) forControlEvents:UIControlEventTouchUpInside];
    lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, huatiBtn.bottom, typeChooseView.bounds.size.width, 1)];
    lineLabel.backgroundColor = [UIColor grayColor];
    [typeChooseView addSubview:huatiBtn];
    [typeChooseView addSubview:lineLabel];
    
}

#pragma mark 关闭/打开下拉视图
- (void)chooseType:(UIButton *)sender
{
    [self closeTypeChoseView:YES];
    showHUD = YES;
    NSInteger tag = sender.tag;
    switch (tag) {
        case 100:
            self.homeView.navigationView.navigationTitle = @"所有信息";
            _indexTableView.indexType = kAllIndexViewInfo;
            [self loadData:index];
            break;
        case 101:
            //选择乐事
            self.homeView.navigationView.navigationTitle = @"乐事";
            _indexTableView.indexType = kLeShiViewInfo;
            [self loadData:index];
            break;
        case 102:
            self.homeView.navigationView.navigationTitle = @"话题";
            _indexTableView.indexType = kHuaTiViewInfo;
            [self loadData:index];
            break;
        default:
            break;
            
    }

}

- (void)closeTypeChoseView:(BOOL)animate
{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromBottom;
    animation.duration = 0.5;
    
    [typeChooseView.layer addAnimation:animation forKey:nil];
    
    typeChooseView.hidden = !isOpen;

    isOpen = !isOpen;
}


#pragma mark viewDidDisappear
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
