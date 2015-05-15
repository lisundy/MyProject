//
//  PersonalInfoTableView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/29.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalInfoTableView.h"
#import "PersonalInfoHeaderView.h"
#import "PersonalIntroductionModel.h"

#import "PersonalLeshiCell.h"
#import "PersonalLeshiFrame.h"
#import "PersonalLeshiModel.h"
#import "MJRefresh.h"
@interface PersonalInfoTableView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,copy)RefreshBlock headerRefreshBlock;
@property(nonatomic,copy)RefreshBlock footerRefreshBlock;

@end

@implementation PersonalInfoTableView

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style andHeaderRefreshBlock:(RefreshBlock)headerRefreshBlock FooterRefreshBlock:(RefreshBlock)footerRefreshBlock{
    self = [self initWithFrame:frame style:style];
    if (self) {
        self.headerRefreshBlock = headerRefreshBlock;
        self.footerRefreshBlock = footerRefreshBlock;
        __weak __typeof(&*self)weakSelf = self;
        [self addLegendFooterWithRefreshingBlock:^{
            weakSelf.footerRefreshBlock();
        }];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
    }
    return self;
}

-(void)endRefresh{
    [self.header endRefreshing];
    [self.footer endRefreshing];
}

-(void)setPersonalLeshiFrames:(NSMutableArray *)personalLeshiFrames{
    _personalLeshiFrames = [personalLeshiFrames mutableCopy];
    [self reloadData];
}

-(void)setPersonalIntroductionModel:(PersonalIntroductionModel *)personalIntroductionModel{
    _personalIntroductionModel = personalIntroductionModel;
    
    PersonalInfoHeaderView *headerView = [[PersonalInfoHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 200)];
    headerView.personalIntroductionModel = _personalIntroductionModel;
    CGRect rect = headerView.frame;
    rect.size.height = headerView.headerViewHeight;
    headerView.frame = rect;
    
    self.tableHeaderView = headerView;
    
}

#pragma mark - tableView
#pragma mark 数据源方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"personalLeshiCell";
    PersonalLeshiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[PersonalLeshiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.personalLeshiFrame = [_personalLeshiFrames objectAtIndex:indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _personalLeshiFrames.count;
}

#pragma mark 代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ((PersonalLeshiFrame *)[_personalLeshiFrames objectAtIndex:indexPath.row]).cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
