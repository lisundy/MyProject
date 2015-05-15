//
//  BaseHomeView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/9.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseHomeView.h"

@implementation BaseHomeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self myInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self myInit];
    }
    return self;
}

//无论用InitWithFrame 还是init。都让这个HomeView占用整个屏幕
-(void)myInit{
    _navigationView = [[BaseNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kStatusBarHeight+kNavigationBarHeight)];
    [self addSubview:_navigationView];
    
    CGFloat navigationViewMaxY = CGRectGetMaxY(_navigationView.frame);
    _contentView = [[BaseView alloc] initWithFrame:CGRectMake(0, navigationViewMaxY , kScreenWidth, kScreenHeight-navigationViewMaxY)];
    _contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_contentView];
}

@end
