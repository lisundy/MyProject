//
//  BaseTableView.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/8.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, RefreshType) {
    RefreshTypeLegendHeader,    //下拉刷新
    RefreshTypeLegendFooter     //上拉刷新
};
@interface BaseTableView : UITableView

@end

#pragma mark - 集成上拉下拉刷新分类
@interface BaseTableView(RefreshTableView)

#pragma mark 添加刷新功能
/*
 输入参数1:刷新类型，如添加下拉刷新(RefreshTypeLegendHeader)，或者上拉刷新(RefreshTypeLegendFooter)
 输入参数2:下拉刷新“动作”完成，进入刷新状态。在block里，主要进行数据的获取
 */
-(void)addRefreshWithRefreshType:(RefreshType)refreshType andRefreshingBlock:(void (^)())refreshingBlock;

//同时集成上拉和下拉功能
-(void)addRefreshWithHeaderRefreshBlock:(void(^)())headerRefreshBlock andFooterRefreshBlock:(void(^)())footerRefreshBlock;

#pragma mark 停止刷新功能
-(void)stopRefreshing;

@end