//
//  EditPersonalViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/20.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "EditPersonalViewController.h"
#import "EditPersonalView.h"
@interface EditPersonalViewController ()

@property(nonatomic,strong)EditPersonalView *editPersonalView;

@end

@implementation EditPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.homeView.contentView.bounds];
    scrollView.contentSize = CGSizeMake(kScreenWidth, CGRectGetHeight(self.homeView.contentView.bounds)+1);
    [self.homeView.contentView addSubview:scrollView];
    
    _editPersonalView = [[EditPersonalView alloc] initWithFrame:scrollView.bounds];
    [scrollView addSubview:_editPersonalView];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.homeView.navigationView.leftButton = backButton;
    
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
