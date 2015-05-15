//
//  LeftViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/8.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "LeftViewController.h"
#import "BaseViewController.h"
#import "LeftMenuTableView.h"


@interface LeftViewController ()
@property (nonatomic, strong) LeftMenuTableView *leftMenuTableView;
@end

@implementation LeftViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    _leftMenuTableView = [[LeftMenuTableView alloc] initWithFrame:CGRectMake(20, 138, 180, 246) style:UITableViewStylePlain];
    _leftMenuTableView.layer.cornerRadius = 8.0f;
    _leftMenuTableView.layer.masksToBounds = YES;
    _leftMenuTableView.scrollEnabled = NO;
    
    //处理回调--改变首页控制器
    
    __block typeof(self) weakSelf = self;//防止循环引用
    _leftMenuTableView.changeBlock = ^(BaseViewController *baseVC,BOOL animate){
        
        UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:baseVC];
        navC.navigationBarHidden = YES;
        
        [weakSelf changeContentViewController:navC animated:YES];
    };
    
    //添加tableview
    [self.view addSubview:_leftMenuTableView];
    self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
}

@end
