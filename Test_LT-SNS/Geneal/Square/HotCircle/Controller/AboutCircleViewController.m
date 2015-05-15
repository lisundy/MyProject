//
//  AboutCircleViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/27.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "AboutCircleViewController.h"

#import "AboutCircleView.h"

@interface AboutCircleViewController ()

@end

@implementation AboutCircleViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.homeView.navigationView.navigationTitle = @"关于圈子";
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.homeView.navigationView.leftButton = backButton;
    
    AboutCircleView *aboutCircleView = [[AboutCircleView alloc] initWithFrame:self.homeView.contentView.bounds];
    [self.homeView.contentView addSubview:aboutCircleView];
}

-(void)backButtonClick:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
