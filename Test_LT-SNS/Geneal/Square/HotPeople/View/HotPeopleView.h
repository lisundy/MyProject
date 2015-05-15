//
//  HotPeopleView.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/23.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"

#define kNotificationHotPeopleCellDidSelected @"hotPeopleCellDidSelected"
#define kNotificationHotPeopleViewSegmentControlValueChange @"hotPeopleViewSegmentControlValueChange"

typedef NS_ENUM(NSInteger, SelectedIndex) {
    SelectedIndexAll = 0,
    SelectedIndexMale = 1,
    SelectedIndexFemale = 2
};

typedef void(^RefreshBlock)();

@class HotPeopleModel;

@interface HotPeopleView : BaseView

@property(nonatomic,strong)NSArray *hotPeopleModels;

-(id)initWithFrame:(CGRect)frame andHeaderRefreshBlock:(RefreshBlock)headerRefreshBlock FooterRefreshBlock:(RefreshBlock)footerRefreshBlock;


-(void)endRefresh;

@end
