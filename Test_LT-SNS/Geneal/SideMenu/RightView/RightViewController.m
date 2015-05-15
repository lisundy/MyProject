//
//  RightViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/8.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "RightViewController.h"
#import "RightView.h"


@interface RightViewController()

@property(nonatomic,strong)RightView *rightView;

@end

@implementation RightViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    _rightView = [[RightView alloc] initWithFrame:CGRectMake(100, 100, 400, 250) style:UITableViewStylePlain];
    
    //weakSelf,防止循环引用
    __weak __typeof(&*self) weakSelf = self;
    
    //设置回调block来处理RightView发过来的更换首页控制器的请求
    _rightView.changeIndexControllerBlock = ^(UIViewController *viewController,BOOL animated){
        [weakSelf changeContentViewController:viewController animated:animated];
    };
    
    [self.view addSubview:_rightView];
}



@end
