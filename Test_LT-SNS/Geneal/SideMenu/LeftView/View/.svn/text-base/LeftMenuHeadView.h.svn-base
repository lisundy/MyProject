//
//  LeftMenuHeadView.h
//  Test_LT-SNS
//
//  Created by pactera on 15/5/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"

@class BaseViewController;

@protocol leftMenuHeadViewDelegate;

@interface LeftMenuHeadView : BaseView

@property (weak, nonatomic) id<leftMenuHeadViewDelegate> delegate;
@end


@protocol leftMenuHeadViewDelegate <NSObject>

- (void)goPersonInfo:(BaseViewController *)baseVC;

@end