//
//  RightView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/9.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "RightView.h"
#import "BaseViewController.h"



@interface RightView()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray   *rightMenuArray;

@end

@implementation RightView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        //创建tableView的数据源
        //创建右侧菜单控制器字符串，用于反射新建类
        _rightMenuArray = [[NSMutableArray alloc] initWithObjects:
                           @{@"MyDynamicViewController":@"我的动态"},
                           @{@"SquareViewController":@"广场"},
                           @{@"MyCollectionViewController":@"收藏"},
                           @{@"PersonalDataViewController":@"资料"},
                           @{@"SystemSettingsViewController":@"设置"}, nil];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.delegate = self;
        self.dataSource = self;
        
        //设置tableView无下划线
        self.separatorColor = UITableViewCellSeparatorStyleNone;
        
        //注册cell
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return self;
}

#pragma mark - UITableView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _rightMenuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = [[[_rightMenuArray objectAtIndex:indexPath.row] allValues] lastObject];
    
    return cell;
}

#pragma mark - UITableView代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //利用反射新建将要打开的控制器
    
    BaseViewController *baseVC = [[NSClassFromString([[[_rightMenuArray objectAtIndex:indexPath.row] allKeys] lastObject]) alloc] init];
    baseVC.homeView.navigationView.navigationTitle =[[[_rightMenuArray objectAtIndex:indexPath.row] allValues] lastObject];
    baseVC.homeView.navigationView.leftButton.hidden = YES;
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:baseVC];
    nav.navigationBarHidden = YES;
    //新建完成后，更改主页控制器
    //[self changeContentViewController:baseVC animated:YES];
    _changeIndexControllerBlock(nav,YES);
    
    //取消tableViewCell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
