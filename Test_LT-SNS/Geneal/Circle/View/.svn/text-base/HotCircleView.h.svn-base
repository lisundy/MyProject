//
//  HotCircleView.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"
#define kNotificationHotCircleViewDidSelectedRow @"HotCircleViewDidSelectedRow"

typedef void(^RefreshBlock)();

@interface HotCircleView : BaseView

@property(nonatomic,strong)NSMutableArray *circleModels;

-(id)initWithFrame:(CGRect)frame andHeaderRefreshBlock:(RefreshBlock)headerRefreshBlock FooterRefreshBlock:(RefreshBlock)footerRefreshBlock;

-(void)endRefreshing;

@end
