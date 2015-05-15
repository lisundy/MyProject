//
//  BaseViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/8.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseHomeView.h"
#import "MBProgressHUD.h"


@interface BaseViewController ()

{
    BOOL _showBackMenu;
}

@end

@implementation BaseViewController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
//        [self myInit];
    }
    return self;
}

-(id)initWithShowBackMenu:(BOOL)showBackMenu{
    self = [super init];
    if (self) {
        _showBackMenu = showBackMenu;
    }
    return self;
}

-(void)myInit{
    
    _homeView = [[BaseHomeView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_homeView];
    if (_showBackMenu) {
        [self showLeftBackButton];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self myInit];
}

#pragma mark - 添加返回按钮
-(void)showLeftBackButton{
    UIButton * backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _homeView.navigationView.leftButton = backButton;
}

-(void)backButtonClick:(UIButton *)button{
    if (self.navigationController.viewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
    
}
#pragma mark - MBProgressHUD的便捷使用

#pragma mark 弹出正在加载气泡
-(void)showProgressHudInView:(UIView *)inView animated:(BOOL)animated{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:inView animated:animated];
    hub.labelText = @"正在加载";
}

#pragma mark 移除正在加载气泡
-(void)hideProgressHudInView:(UIView *)inView animated:(BOOL)animated{
    [MBProgressHUD hideHUDForView:inView animated:animated];
}

#pragma mark 切换页面
- (void)pushVCWithAnimation:(BaseViewController *)vc
{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.7;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark popVC
- (void)popVCWithAnimation
{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionReveal;
    animation.duration = 0.7;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    currentVC = self;
}

@end
