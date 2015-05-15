//
//  SystemSettingsViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/9.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "SystemSettingsViewController.h"
#import "SystemSettingsView.h"
#import "RequestUtils.h"
#import "UIUtils.h"

@interface SystemSettingsViewController ()

@property(nonatomic,strong)SystemSettingsView *settingView;

@end

@implementation SystemSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeView.navigationView.navigationTitle = @"设置";
    //新建scrollview，为了包裹tableView+登出按钮。仅用于滚动。
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.homeView.contentView.bounds];
    scrollView.contentSize = CGSizeMake(self.homeView.contentView.bounds.size.width, self.homeView.contentView.bounds.size.height+1);//self.homeView.contentView.bounds.size;
    [self.homeView.contentView addSubview:scrollView];
    
    //新建设置的View，坐标写死了
    _settingView = [[SystemSettingsView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.bounds.size.width, 400) style:UITableViewStyleGrouped];
    __weak __typeof(&*self) weakSelf = self;
    _settingView.selectedControllerStringBlock = ^(NSString *controllerString){
        __strong __typeof(&*weakSelf) strongSelf = weakSelf;
        BaseViewController *vc = [[NSClassFromString(controllerString) alloc] initWithShowBackMenu:YES];
        
        [strongSelf.navigationController pushViewController:vc animated:YES];
        
    };
    [scrollView addSubview:_settingView];
    
    //设置按钮左右边距，离Screen的距离
    CGFloat offset = 10;
    
    //添加登出按钮
    UIButton *logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(offset, CGRectGetMaxY(_settingView.frame),kScreenWidth-2*offset, 60)];
    logoutButton.backgroundColor = [UIColor redColor];
    logoutButton.layer.masksToBounds = YES;
    logoutButton.layer.cornerRadius = 10.0f;
    [logoutButton setTitle:@"登出" forState:UIControlStateNormal];
    [logoutButton addTarget:self action:@selector(logoutButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:logoutButton];
    
    NSString *token = [UIUtils getToken];
    RequestUtils *request = [[RequestUtils alloc] init];
    
    [request doGetHttpRequestWithParameters:@{@"token":token}
                                     andURL:@"users/valid_msg.json"
                                 andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                                     //NSLog(@"%@",responseObject);
                                     if ([[responseObject objectForKey:@"ismobile"] boolValue]){
                                         [_settingView setMobileNumber:[responseObject objectForKey:@"mobile"]];
                                     }
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}
//登出按钮被点击了
-(void)logoutButtonClick:(UIButton *)button{
    NSLog(@"登出按钮被点击");
}


@end
