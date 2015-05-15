//
//  PersonalDataViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/9.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalDataViewController.h"
#import "PersonalDataView.h"
@interface PersonalDataViewController ()

@end

@implementation PersonalDataViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homeView.navigationView.navigationTitle = @"个人资料";
    
//    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
//    [backButton setTitle:@"返回" forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    self.homeView.navigationView.leftButton = backButton;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.homeView.contentView.bounds];
    
    PersonalDataView *dataView = [[PersonalDataView alloc] initWithFrame:self.homeView.contentView.bounds];
    
    CGFloat offset = 10;
    //控制器的contentView高度
    CGFloat contentViewHeight = CGRectGetHeight(self.homeView.contentView.bounds);
    //ScrollView内容高度
    CGFloat scrollViewContentHeight = dataView.viewHeight >  contentViewHeight ? dataView.viewHeight+offset:contentViewHeight+offset;
    
    scrollView.contentSize = CGSizeMake(kScreenWidth, scrollViewContentHeight);
    
    [scrollView addSubview:dataView];
    [self.homeView.contentView addSubview:scrollView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editButtonClick:) name:kNotificationNamePersonalIntroductionEditButtonClick object:nil];

}

-(void)editButtonClick:(NSNotification *)notification{
    NSString *controllerName = [notification.userInfo objectForKey:@"controllerName"];
    BaseViewController *baseVC = [[NSClassFromString(controllerName) alloc] init];
    [self.navigationController pushViewController:baseVC animated:YES];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushControllerByNotification:) name:kNotificationNamePersonalQuickSkip object:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationNamePersonalQuickSkip object:nil];
}

-(void)pushControllerByNotification:(NSNotification *)notification{
    NSString *controllerName = [[notification userInfo] objectForKey:@"controllerName"];
    BaseViewController *baseVC = [[NSClassFromString(controllerName) alloc] init];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    
    baseVC.homeView.navigationView.leftButton = backButton;
    [self.navigationController pushViewController:baseVC animated:YES];
}


-(void)backButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
