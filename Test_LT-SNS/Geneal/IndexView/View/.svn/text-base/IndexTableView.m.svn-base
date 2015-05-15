//
//  IndexTableView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "IndexTableView.h"
#import "IndexViewCell.h"
#import "IndexCellModel.h"
#import "IndexViewController.h"
#import "LeShiDetailViewController.h"
#import "HuaTiViewController.h"

#define CellIdentifierIndex @"CellIdentifierIndex"
#define CellIdentifierLeshi @"CellIdentifierLeshi"
#define CellIdentifierHuati @"CellIdentifierHuati"

@interface IndexTableView ()

@property (retain, nonatomic) id<IndexTitleBtnDelegate> closeViewDelegate;

@end

@implementation IndexTableView

#pragma mark init
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.indexType = kAllIndexViewInfo;
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

#pragma mark UITableView-delegate代理方法
//获取行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

//cell生成
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IndexViewCell *cell = nil;
    
    if ([_indexType isEqualToString:kAllIndexViewInfo]) {
        
        cell = [tableView cellForRowAtIndexPath:indexPath];
//        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierIndex];
        
        if (cell == nil) {
            
            cell =[[IndexViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierIndex];
        }
        
        IndexCellModel *indexCellModel = [_data objectAtIndex:indexPath.row];
        cell.indexCellModel = indexCellModel;
        cell.type = kAllIndexViewInfo;
        
    }
    
    if ([_indexType isEqualToString:kLeShiViewInfo]) {
        
//        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierLeshi];
        cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            
            cell =[[IndexViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierLeshi];
        }

        LeShiViewModel *leshiViewModel = [_data objectAtIndex:indexPath.row];
        cell.leshiViewModel = leshiViewModel;
        cell.type = kLeShiViewInfo;

    }
    
    if ([_indexType isEqualToString:kHuaTiViewInfo]) {
        
//        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierHuati];
        cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            
            cell =[[IndexViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierHuati];
        }
        
        HuaTiViewModel *huatiViewModel = [_data objectAtIndex:indexPath.row];
        cell.huatiViewModel = huatiViewModel;
        cell.type = kHuaTiViewInfo;
        
    }
    cell.indexTableView = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}


#pragma mark 根据信息类型动态设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        //如果首页显示的是所有类型的信息
    if ([_indexType isEqualToString:kAllIndexViewInfo]) {
        
        return [IndexViewCell getIndexCellHeight:[_data objectAtIndex:indexPath.row]];
    }
    
    if ([_indexType isEqualToString:kLeShiViewInfo]) {

        return [IndexViewCell getLeshiCellHeight:[_data objectAtIndex:indexPath.row]];
    }
    
    if ([_indexType isEqualToString:kHuaTiViewInfo]) {

        return [IndexViewCell getHuatiCellHeight:[_data objectAtIndex:indexPath.row]];
    }
    
    return 0;
}

#pragma mark 点击cell操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //取消选择状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    //进入信息详情页面
    //信息类型 100代表乐事 101代表心情 102代表话题 103代表乐讯
    
    BaseViewController *baseVC = nil;
    
    //关闭信息类型选择视图
    [self closeTypeView];
    
    if ([_indexType isEqualToString:kAllIndexViewInfo]) {
        //如果显示所有类型信息
        
        NSString *infoType = ((IndexCellModel *)[_data objectAtIndex:indexPath.row]).type;
        
        //乐事
        if ([infoType isEqualToString:@"100"]) {
            
            NSString *ID = ((IndexCellModel *)[_data objectAtIndex:indexPath.row]).indexInfoID;
            
            baseVC = [[LeShiDetailViewController alloc] initWithID:ID];
            
        }
        //话题
        if ([infoType isEqualToString:@"102"]) {
            
            NSString *ID = ((IndexCellModel *)[_data objectAtIndex:indexPath.row]).indexInfoID;
            
            baseVC = [[HuaTiViewController alloc] initWithID:ID];
        }
    }
    //所有的都是乐事信息
    if ([_indexType isEqualToString:kLeShiViewInfo]) {
        
        LeShiViewModel *leshiModel = [_data objectAtIndex:indexPath.row];
        
        baseVC = [[LeShiDetailViewController alloc] initWithID:leshiModel.hid];
    }
    //所有的都是话题信息
    if ([_indexType isEqualToString:kHuaTiViewInfo]) {
        
        HuaTiViewModel *huatiModel = [_data objectAtIndex:indexPath.row];
        
        baseVC = [[HuaTiViewController alloc] initWithID:huatiModel.tid];
    }
    
    [_currVC pushVCWithAnimation:baseVC];
}


#pragma mark IndexTableViewDelegate代理方法
- (void)openLeshiDetailVC:(LeShiViewModel *)leshiModel
{
    BaseViewController *baseVC = [[LeShiDetailViewController alloc] initWithID:leshiModel.hid];
    
    [_currVC pushVCWithAnimation:baseVC];

}

- (void)closeTypeView
{
    [self.closeViewDelegate closeTypeChoseView:YES];
}

#pragma mark 移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
