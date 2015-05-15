//
//  CircleViewController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "CircleViewController.h"
#import "BaseViewController.h"
#import "BaseTableView.h"
#import "TabbarView.h"
#import "CircleCell.h"
#import "CircleModel.h"
#import "CircleDetailVController.h"
#import "RequestUtils.h"
#import "UIUtils.h"


@interface CircleViewController () <TabbarViewEventDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSArray             *arrayVCTitle;
    TabbarView          *tabbarView;
    BaseTableView       *tableviewCircle;
    BOOL                 isMore;
    BOOL                 showHUD;
}

@end

@implementation CircleViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        arrayVCTitle = [[NSArray alloc] initWithObjects:@"我加入的圈子",@"创建圈子",@"我创建的圈子", nil];

        
        [self loadJoinedCircleData];
    }
    return self;
}

#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initComponent];
    
    self.homeView.navigationView.navigationTitle = @"我的圈子";
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];

}

#pragma mark 加载网络数据
- (void)loadJoinedCircleData
{
    //quan/q_join
    RequestUtils *request = [[RequestUtils alloc] init];
    NSMutableDictionary *params = [UIUtils getParam];
    
    if (showHUD) {
        [self showProgressHudInView:self.view animated:YES];
    }
    
    [request doGetHttpRequestWithParameters:params andURL:@"quan/q_join.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        
        if ([@"100" isEqualToString:code]) {
            
            [self hideProgressHudInView:self.view animated:YES];
            [self loadDataFinished:responseObject];
        }
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self hideProgressHudInView:self.view animated:YES];

        NSLog(@"%@",error);
    }];
}


- (void)loadDataFinished:(id)result
{
    
    NSString *count = [result objectForKey:@"total_count"];
    
    if ([@"0" isEqualToString:count]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"你还未创建圈子" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [self.homeView addSubview:alert];
        [alert show];
        return;
    }
    
    NSMutableArray *dataArray = [result objectForKey:@"obj"];
    NSMutableArray *tData     = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    
    for (int i = 0; i<dataArray.count; i++) {
        
        NSDictionary *dic = [dataArray objectAtIndex:i];
        
        CircleModel *circleModel = [[CircleModel alloc] initWithHotCircleDictionary:dic];
        [tData addObject:circleModel];
    }
    
    if (isMore) {
        [_data addObjectsFromArray:tData];
    }else{
        _data = tData;
    }
    
    [tableviewCircle reloadData];
}

#pragma mark 加载已经创建的圈子
- (void)loadCreatedCircleData
{
    //quan/q_create
    RequestUtils *request = [[RequestUtils alloc] init];
    NSMutableDictionary *params = [UIUtils getParam];
    
    if (showHUD) {
        [self showProgressHudInView:self.view animated:YES];
    }
    
    [request doGetHttpRequestWithParameters:params andURL:@"quan/q_create.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        
        if ([@"100" isEqualToString:code]) {
            
            [self hideProgressHudInView:self.view animated:YES];
            [self loadDataFinished:responseObject];
        }
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


- (void)initComponent
{
    CGSize contentViewSize = self.homeView.contentView.size;
    
    //Tableview
    tableviewCircle = [[BaseTableView alloc] initWithFrame:
                       CGRectMake(0, 0, contentViewSize.width, contentViewSize.height - 49)
                                                     style:UITableViewStylePlain];
    tableviewCircle.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableviewCircle.delegate = self;
    tableviewCircle.dataSource = self;
    
    [self.homeView.contentView addSubview:tableviewCircle];
    
    //
    tabbarView = [[TabbarView alloc] initWithFrame:
                  CGRectMake(3, contentViewSize.height - 48, contentViewSize.width -6, 48)];
    tabbarView.layer.cornerRadius = 6;
    tabbarView.layer.borderWidth = 2.0;
    tabbarView.layer.borderColor = [UIColor grayColor].CGColor;
    tabbarView.layer.masksToBounds = YES;
    tabbarView.delegate = self;
    
    [self.homeView.contentView addSubview:tabbarView];
}

#pragma mark TabbarViewEventDelegate
- (void)selected:(ButtonSelectedType)btntype
{
    showHUD = YES;
    
    switch (btntype) {
        case BtnJoinedCircleType:
            [self loadJoinedCircleData];
            break;
        case BtnCreatingCircleType:
            
            [self changeVC:btntype];
            
            break;
        case BtnCreatedCircleType:
            
            [self loadCreatedCircleData];
            break;
            
        default:
            break;
    }
}

#pragma mark changeVC
- (void)changeVC:(ButtonSelectedType)btntype
{
    if (NO) {
        
        BaseViewController *baseVC = nil;
        baseVC = [[NSClassFromString(@"CreatingCircleVController") alloc] init];
        baseVC.homeView.navigationView.navigationTitle = [arrayVCTitle objectAtIndex:btntype];
        
        [self pushVCWithAnimation:baseVC];
        
        [self.navigationController pushViewController:baseVC animated:YES];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"创建圈子" message:@"你没有权限" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [self.view addSubview:alert];
        
        [alert show];
    }
}


#pragma mark Tableview -delegate&datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    CircleCell *cell = [tableviewCircle dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[CircleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.circleModel = [_data objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CircleModel *circleModel = [_data objectAtIndex:indexPath.row];
    
    BaseViewController *baseVC = [[CircleDetailVController alloc] initID:circleModel.gid withTitle:circleModel.circleName];
    
    [self pushVCWithAnimation:baseVC];
    
    [tableviewCircle deselectRowAtIndexPath:indexPath animated:YES];
}

@end
