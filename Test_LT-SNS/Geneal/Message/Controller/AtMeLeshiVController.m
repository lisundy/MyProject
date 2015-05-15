//
//  AtMeLeshiVController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/25.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "AtMeLeshiVController.h"
#import "IndexTableView.h"
#import "LeShiViewModel.h"
#import "UserModel.h"

@interface AtMeLeshiVController ()
{
    IndexTableView *tableView;
    LeShiViewModel *leshiModel;
    NSMutableArray *data;//保存数据
}

@end

@implementation AtMeLeshiVController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


#pragma mark -viewDidLoad
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 30, 44)];
    [button addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"back_btn"] forState:UIControlStateNormal];
    
    self.homeView.navigationView.navigationTitle = @"@我的乐事";
    [self.homeView.navigationView addSubview:button];
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
    
    //@我的乐事列表--使用IndexTableView
    tableView = [[IndexTableView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.contentView.width, self.homeView.contentView.height)];
    tableView.currVC = self;
    tableView.indexType = @"kallleshimodel";
    tableView.tableFooterView = [[UIView alloc] init];
    [self.homeView.contentView addSubview:tableView];
    
    [self loadData];
}


#pragma mark loadData
- (void)loadData
{
    data = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<3; i++) {
        
        leshiModel = [[LeShiViewModel alloc] init];
        UserModel *userModel = [[UserModel alloc] init];
        
        userModel.curr_head = @"head1.jpg";
        userModel.nick = @"你猜";
        leshiModel.userModel = userModel;
        
        leshiModel.short_text = @"@习大大@sundykkk@dddd";
        leshiModel.feedback_count = @"6";
        leshiModel.create_time = @"2015-4-25";
        leshiModel.ohid = @"0";
        
        [data addObject:leshiModel];
        
    }
    
    //加载成功
    [self loadDataSuccess];
}


#pragma mark loadDataSuccuss
- (void)loadDataSuccess
{
    tableView.data = data;
//    tableView.frame = CGRectMake(0, 0, self.homeView.contentView.width, [IndexTableView get])
    
    [tableView reloadData];
}

#pragma mark backClick
- (void)backClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
