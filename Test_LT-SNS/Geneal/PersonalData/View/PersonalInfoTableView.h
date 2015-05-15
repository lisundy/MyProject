//
//  PersonalInfoTableView.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/29.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseTableView.h"

typedef void(^RefreshBlock)();

@class PersonalIntroductionModel;

@interface PersonalInfoTableView : BaseTableView

@property(nonatomic,copy)NSMutableArray *personalLeshiFrames;

@property(nonatomic,strong)PersonalIntroductionModel *personalIntroductionModel;

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style andHeaderRefreshBlock:(RefreshBlock)headerRefreshBlock FooterRefreshBlock:(RefreshBlock)footerRefreshBlock;


-(void)endRefresh;

@end
