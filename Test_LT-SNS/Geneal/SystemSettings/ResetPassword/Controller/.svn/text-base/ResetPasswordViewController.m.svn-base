//
//  ResetPasswordViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "ResetPasswordView.h"
@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController


//-(void)loadView
//{
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.view = scrollView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeView.navigationView.navigationTitle = @"重置密码";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.homeView.navigationView.leftButton = btn;
    
    ResetPasswordView *resetPasswordView = [[ResetPasswordView alloc] initWithFrame:self.homeView.contentView.bounds];
    [self.homeView.contentView addSubview:resetPasswordView];
    
}

-(void)btnClick:(UIButton *)btn{

    [self.navigationController popViewControllerAnimated:YES];
}

@end
