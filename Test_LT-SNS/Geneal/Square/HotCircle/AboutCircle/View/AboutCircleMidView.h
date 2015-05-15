//
//  AboutCircleMidView.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"

@interface AboutCircleMidView : BaseView

@property(nonatomic,copy)NSArray *aboutCircleFrames;

- (instancetype)initWithFrame:(CGRect)frame aboutCircleFrames:(NSArray *)aboutCircleFrames;

@end
