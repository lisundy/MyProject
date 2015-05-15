//
//  BaseHomeView.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/9.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"
#import "BaseNavigationView.h"

@interface BaseHomeView : BaseView

@property(nonatomic,strong)BaseNavigationView *navigationView;
@property(nonatomic,strong)BaseView *contentView;

@end
