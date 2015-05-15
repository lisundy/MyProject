//
//  PersonalDataView.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"
//有一个Notification Name的宏
#import "PersonalQuickSkipView.h"
#import "PersonalIntroductionView.h"

@class PersonalCountView;

@interface PersonalDataView : BaseView

@property(nonatomic,strong)PersonalIntroductionView *introduceView;
@property(nonatomic,strong)PersonalQuickSkipView *quickSkipView;
@property(nonatomic,strong)PersonalCountView *countView;

@property(nonatomic,assign,readonly)CGFloat viewHeight;     //这个View的高度

@end
