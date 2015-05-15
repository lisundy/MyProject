//
//  CircleDetailVController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/30.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "CircleDetailVController.h"
#import "IndexTableView.h"
#import "RequestUtils.h"
#import "UIUtils.h"
#import "HintNoDataLabel.h"

@interface CircleDetailVController ()
{
    IndexTableView          *myTable;
    NSString                *index;
    BOOL                     isMore;
    BOOL                     showHUD;
}

@end

@implementation CircleDetailVController

- (id)initID:(NSString *)ID withTitle:(NSString *)titleName
{
    if (self = [super init]) {
        
        _ID = ID;
        _titleName = titleName;
        index = @"1";
        [self loadData:index];
    }
    
    return self;
}

#pragma mark 加载网络数据
- (void)loadData:(NSString *)page
{
    //quan/show
    RequestUtils *request = [[RequestUtils alloc] init];
    
    NSMutableDictionary *params = [UIUtils getParam];
    [params setObject:_ID forKey:@"gid"];
    [params setObject:page forKey:@"index"];
    [params setObject:SIZE forKey:@"size"];
    
    if (showHUD) {
        [self showProgressHudInView:self.view animated:YES];
    }
    
    [request doGetHttpRequestWithParameters:params andURL:@"ht/quan_list.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        if ([@"100" isEqualToString:code]) {
            
            [self hideProgressHudInView:self.view animated:YES];
            [myTable stopRefreshing];
            [self loadDataFinished:responseObject];
        }
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        [myTable stopRefreshing];
    }];
}

- (void)loadDataFinished:(id)result
{
    NSMutableArray *dataArray = [result objectForKey:@"obj"];
    NSMutableArray *tData     = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    
    if ([@"0" isEqualToString:[result objectForKey:@"total_count"]]) {
        myTable.hidden = YES;
        CGRect rect = CGRectMake(0, 100, SCREEN_WIDTH, 200);
        HintNoDataLabel *label = [[HintNoDataLabel alloc] init:rect WithText:@"该圈子还没有动态"];
        [self.homeView.contentView addSubview:label];
        return;
    }
    
    for (int i = 0; i<dataArray.count; i++) {
        
        NSDictionary *dic = [dataArray objectAtIndex:i];
        HuaTiViewModel *huatiModel = [[HuaTiViewModel alloc] initWithDataDic:dic];
        [tData addObject:huatiModel];
    }
    
    if (isMore) {
        [_data addObjectsFromArray:tData];
    }else{
        _data = tData;
    }
    
    myTable.data = _data;
    [myTable reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *leftButton = [UIFactory createNavBtnWith:
                            [UIImage imageNamed:@"back_btn"] frame:CGRectMake(10, 20, 30, 44)];
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.homeView.navigationView addSubview:leftButton];
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
    self.homeView.navigationView.navigationTitle = _titleName;
    
    myTable = [[IndexTableView alloc] initWithFrame:self.homeView.contentView.frame style:UITableViewStylePlain];
    myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTable.currVC = self;
    myTable.indexType = kHuaTiViewInfo;
    
    __block typeof(self) weakSelf = self;
    [myTable addRefreshWithHeaderRefreshBlock:^{
       
        [weakSelf downRefresh];
    } andFooterRefreshBlock:^{
        [weakSelf upRefresh];
    }];
    
    [self.view addSubview:myTable];
    
}

#pragma mark 上拉刷新
- (void)upRefresh
{
    showHUD = NO;
    isMore = YES;
    index = [NSString stringWithFormat:@"%i",[index intValue]+1];
    [self loadData:index];
}

#pragma mark 下拉刷新
- (void)downRefresh
{
    showHUD = NO;
    isMore = NO;
    index = @"1";
    [self loadData:index];
}

- (void)buttonClick:(UIButton *)sender
{
    [self popVCWithAnimation];
}
@end
