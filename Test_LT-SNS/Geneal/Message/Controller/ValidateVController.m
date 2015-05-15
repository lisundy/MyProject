//
//  ValidateVController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/27.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "ValidateVController.h"

@interface ValidateVController ()
{
    UIAlertView *alertView;
}

@end

@implementation ValidateVController

- (void)loadData
{
    [self loadDataSuccess];
}

- (void)loadDataSuccess
{
    [alertView show];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 30, 44)];
    [button addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"back_btn"] forState:UIControlStateNormal];
    
    self.homeView.navigationView.navigationTitle = @"@我的乐事";
    [self.homeView.navigationView addSubview:button];
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
    
    alertView = [[UIAlertView alloc] initWithTitle:@"验证信息" message:@"没有需要验证的消息" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [self.view addSubview:alertView];
    
    [self loadData];
}

#pragma mark 返回页面
- (void)backClick:(UIButton *)sender
{
    [self popVCWithAnimation];
}

@end
