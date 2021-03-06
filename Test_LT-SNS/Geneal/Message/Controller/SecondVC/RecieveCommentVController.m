//
//  RecieveCommentVController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/27.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "RecieveCommentVController.h"
#import "BaseTableView.h"
#import "CommentCell.h"
#import "IndexCellModel.h"
#import "LeShiDetailViewController.h"
#import "HuaTiViewController.h"
#import "RequestUtils.h"
#import "UIUtils.h"
#import "HintNoDataLabel.h"

@interface RecieveCommentVController () <UITableViewDataSource, UITableViewDelegate>
{
    BaseTableView   *myTableView;
    CGSize          screenSize;
    NSString        *index;
    BOOL            isMore;
    BOOL            showHUD;
    RequestUtils    *request;
    
}

@end

@implementation RecieveCommentVController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        index = @"1";
        showHUD = YES;
        [self loadData:index];
    }
    return self;
}

#pragma mark 加载网络数据
- (void)loadData:(NSString *)index
{
    request = [[RequestUtils alloc] init];
    
    NSMutableDictionary *params = [UIUtils getParam];
    [params setObject:index forKey:@"index"];
    [params setObject:SIZE forKey:@"size"];
    
    if (showHUD) {
        [self showProgressHudInView:self.view animated:YES];
    }
    
    __block typeof(self) weakSelf = self;
    [request doGetHttpRequestWithParameters:params andURL:@"comment/to_me.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        if ([@"100" isEqualToString:code]) {
            
            [weakSelf hideProgressHudInView:weakSelf.view animated:YES];
            [myTableView stopRefreshing];
            
            [weakSelf loadDataFinished:responseObject];
        }
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weakSelf hideProgressHudInView:weakSelf.view animated:YES];
        [myTableView stopRefreshing];
    }];
}

//加载成功
- (void)loadDataFinished:(id)result
{
    NSMutableArray *dataArray = [result objectForKey:@"obj"];
    NSMutableArray *cData     = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    
    if ([@"0" isEqualToString:[result objectForKey:@"total_count"]]) {
        myTableView.hidden = YES;
        CGRect rect = CGRectMake(0, 100, SCREEN_WIDTH, 200);
        HintNoDataLabel *label = [[HintNoDataLabel alloc] init:rect WithText:@"没有关于你的评论数据"];
        [self.homeView.contentView addSubview:label];
        return;
    }
    
    for (int i = 0; i<dataArray.count; i++) {
        
        NSDictionary *dic = [dataArray objectAtIndex:i];
        IndexCellModel *model = [[IndexCellModel alloc] initWithDataDic:dic];
        
        [cData addObject:model];
    }
    
    if (isMore) {
        [_data addObjectsFromArray:cData];
    }else{
        _data = cData;
    }
    
    [myTableView reloadData];
}

#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 30, 44)];
    [button addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"back_btn"] forState:UIControlStateNormal];
    
    self.homeView.navigationView.navigationTitle = @"我收到的评论";
    [self.homeView.navigationView addSubview:button];
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
    
    myTableView = [[BaseTableView alloc]
                 initWithFrame:CGRectMake(0, 0, self.homeView.contentView.width, self.homeView.contentView.height) style:UITableViewStylePlain];
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    __block typeof(self) weakSelf = self;
    [myTableView addRefreshWithHeaderRefreshBlock:^{
        
        [weakSelf downRefresh];
    } andFooterRefreshBlock:^{
        
        [weakSelf upRefresh];
    }];
    
    [self.homeView.contentView addSubview:myTableView];
}

#pragma mark 设置未读消息状态
- (void)updataMessageReadStatus:(NSString *)msgID
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:msgID forKey:@"remindid"];
    [params setObject:[UIUtils getToken] forKey:@"token"];
    
    [request doPostHttpRequestWithParameters:params andURL:@"exten/update_status.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark TableView delegate&dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.model = [_data objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CommentCell getCellHeight:[_data objectAtIndex:indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    IndexCellModel *indexModel = [_data objectAtIndex:indexPath.row];
    BaseViewController *baseVC = nil;
    //更新未读状态
    [self updataMessageReadStatus:indexModel.remindid];
    
    if ([indexModel.obj_type isEqualToString:@"100"]) {
        //乐事
        baseVC = [[LeShiDetailViewController alloc] initWithID:indexModel.obj_id];
        
    }
    
    if ([indexModel.obj_type isEqualToString:@"102"]) {
        //话题
        baseVC = [[HuaTiViewController alloc] initWithID:indexModel.obj_id];
    }
    [self pushVCWithAnimation:baseVC];
    
}

#pragma mark downRefresh
- (void)downRefresh
{
    index = @"1";
    showHUD = NO;
    isMore = NO;
    [self loadData:index];
}

#pragma mark 上拉刷新
- (void)upRefresh
{
    isMore = YES;
    showHUD = NO;
    index = [NSString stringWithFormat:@"%i",[index intValue]+1];
    [self loadData:index];
}

#pragma mark 返回上级页面
- (void)backClick:(UIButton *)sender
{
    [self popVCWithAnimation];
}

@end
