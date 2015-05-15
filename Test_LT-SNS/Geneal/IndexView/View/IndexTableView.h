//
//  IndexTableView.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BaseTableView.h"
#import "LeShiViewModel.h"
#import "HuaTiViewModel.h"

@protocol IndexTableViewDelegate <NSObject>

- (void)openLeshiDetailVC:(LeShiViewModel *)leshiModel;

@end

@protocol IndexTableViewDelegate;
@protocol IndexTitleBtnDelegate;


@class BaseViewController;
@interface IndexTableView : BaseTableView <UITableViewDataSource,UITableViewDelegate,IndexTableViewDelegate>

@property (copy,   nonatomic) NSString *indexType;//首页信息类型
//@property (retain, nonatomic) NSMutableArray *data;
@property (weak, nonatomic) BaseViewController *currVC;//在哪个控制器里面

@property (retain, nonatomic) NSMutableArray *data;

@end