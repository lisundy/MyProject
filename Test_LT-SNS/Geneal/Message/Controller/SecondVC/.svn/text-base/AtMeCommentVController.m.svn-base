//
//  AtMeCommentVController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/27.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "AtMeCommentVController.h"
#import "BaseTableView.h"
#import "CommentCell.h"
#import "LeShiDetailViewController.h"
#import "HuaTiViewController.h"
#import "IndexCellModel.h"
#import "RequestUtils.h"
#import "UIUtils.h"

@interface AtMeCommentVController () <UITableViewDataSource, UITableViewDelegate>
{
    BaseTableView       *myTable;
    NSString            *index;
    BOOL                isMore;
    BOOL                showHUD;
    RequestUtils        *request;
}

@end

@implementation AtMeCommentVController

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
- (void)loadData:(NSString *)page
{
    request = [[RequestUtils alloc] init];
    
    NSMutableDictionary *params = [UIUtils getParam];
    [params setObject:SIZE forKey:@"size"];
    [params setObject:page forKey:@"index"];
    
    if (showHUD) {
        [self showProgressHudInView:self.view animated:YES];
    }
    
    [request doGetHttpRequestWithParameters:params andURL:@"comment/at_me.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        
        if ([@"100" isEqualToString:code]) {
            
            showHUD = NO;
            [myTable stopRefreshing];
            [self hideProgressHudInView:self.view animated:YES];
            [self loadDataFinished:responseObject];
        }
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        [self hideProgressHudInView:self.view animated:YES];
        [myTable stopRefreshing];
    }];

}

//加载成功
- (void)loadDataFinished:(id)result
{
    NSMutableArray *dataArray = [result objectForKey:@"obj"];
    NSMutableArray *cData = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    
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
    
    [myTable reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 30, 44)];
    [button addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"back_btn"] forState:UIControlStateNormal];
    
    self.homeView.navigationView.navigationTitle = @"@我的评论";
    [self.homeView.navigationView addSubview:button];
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
    
    myTable = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.contentView.width, self.homeView.contentView.height) style:UITableViewStylePlain];
    myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTable.delegate = self;
    myTable.dataSource = self;
    
    __block typeof(self) weakSelf = self;
    [myTable addRefreshWithHeaderRefreshBlock:^{
        
        [weakSelf downRefresh];
        
    } andFooterRefreshBlock:^{
        [weakSelf upRefresh];
    }];
    
    [self.homeView.contentView addSubview:myTable];
}

#pragma mark 设置未读消息状态
- (void)updataMessageReadStatus:(NSString *)msgID
{
    NSMutableDictionary *params = [UIUtils getParam];
    [params setObject:msgID forKey:@"remindid"];
    
    [request doPostHttpRequestWithParameters:params andURL:@"exten/update_status.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark 下拉
- (void)downRefresh
{
    isMore = NO;
    showHUD = NO;
    
    index = @"1";
    [self loadData:index];
}


#pragma mark上拉
- (void)upRefresh
{
    isMore = YES;
    showHUD = NO;
    index = [NSString stringWithFormat:@"%i",[index intValue]+1];
    [self loadData:index];
}

#pragma mark TableView:dataSource&delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [CommentCell getCellHeight:[_data objectAtIndex:indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    CommentCell *cell = [myTable dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    cell.model = [_data objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //判断信息类型，打开不同的信息页面
    IndexCellModel *indexModel = [_data objectAtIndex:indexPath.row];
    [self updataMessageReadStatus:indexModel.remindid];
    BaseViewController *baseVC = nil;
    
    if (indexModel != nil) {
        
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
}

#pragma mark 页面返回
- (void)backClick:(UIButton *)sender
{
    [self popVCWithAnimation];
}

@end
