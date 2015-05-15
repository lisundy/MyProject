//
//  SquareViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/9.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "SquareViewController.h"
#import "SquareView.h"

@interface SquareViewController ()

@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak __typeof(&*self)weakSelf = self;
    SquareView *squareView = [[SquareView alloc] initWithFrame:self.homeView.contentView.bounds need2PushControllerBlock:^(NSString *controllerString) {
        __strong __typeof(&*weakSelf)strongSelf = weakSelf;
        BaseViewController *baseVC = [[NSClassFromString(controllerString) alloc] init];
        [strongSelf.navigationController pushViewController:baseVC animated:YES];
    }];
    [self.homeView.contentView addSubview:squareView];
    
    self.homeView.navigationView.navigationTitle = @"广场";
    
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
