//
//  CreatingCircleVController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/30.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "CreatingCircleVController.h"

@interface CreatingCircleVController ()

@end

@implementation CreatingCircleVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *leftButton = [UIFactory createNavBtnWith:
                            [UIImage imageNamed:@"back_btn"] frame:CGRectMake(10, 20, 30, 44)];
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.homeView.navigationView.navigationTitle = @"创建圈子";
    [self.homeView.navigationView addSubview:leftButton];
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];

}

- (void)buttonClick:(UIButton *)sender
{
    [self popVCWithAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
