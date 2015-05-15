//
//  PersonalCountView.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"

@class PersonalCountModel;

@interface PersonalCountView : BaseView


@property(nonatomic,strong)PersonalCountModel *personalCountModel;

@property(nonatomic,assign,readonly)CGFloat personalCountViewHeight;    //这个View的高度



@end
