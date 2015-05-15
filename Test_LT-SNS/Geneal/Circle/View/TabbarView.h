//
//  TabbarView.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/30.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"

#define KTABBARHEIGHT 48

typedef NS_ENUM(NSInteger, ButtonSelectedType)
{
    BtnJoinedCircleType = 0,         //已经加入的圈子按钮
    BtnCreatingCircleType = 1,       //创建圈子按钮
    BtnCreatedCircleType = 2         //已经创建的圈子按钮
};


@protocol TabbarViewEventDelegate;
@interface TabbarView : BaseView

@property (weak, nonatomic) id<TabbarViewEventDelegate> delegate;

@end


@protocol TabbarViewEventDelegate <NSObject>

- (void)selected:(ButtonSelectedType)btntype;

@end