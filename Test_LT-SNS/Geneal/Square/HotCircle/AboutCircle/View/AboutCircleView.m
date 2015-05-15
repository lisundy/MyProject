//
//  AboutCircleView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "AboutCircleView.h"
#import "AboutCircleHeadView.h"
#import "AboutCircleMidView.h"
#import "AboutCircleFrame.h"
#import "AboutCircleModel.h"
#import "AboutCircleBottomView.h"

@interface AboutCircleView ()

@property(nonatomic,strong)AboutCircleHeadView *headView;
@property(nonatomic,strong)AboutCircleMidView *midView;
@property(nonatomic,strong)AboutCircleBottomView *bottomView;
@end

@implementation AboutCircleView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _headView = [[AboutCircleHeadView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), 60) AvatarString:nil CircleName:nil];
        [self addSubview:_headView];
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        AboutCircleFrame *frame = [[AboutCircleFrame alloc] init];
        AboutCircleModel *model = [[AboutCircleModel alloc] init];
        model.titleString = @"我是标题";
        model.contentString = @"我是内容如";
        frame.model = model;
        [array addObject:frame];
        for (NSInteger i = 0; i<4; i++) {
            AboutCircleFrame *frame = [[AboutCircleFrame alloc] init];
            AboutCircleModel *model = [[AboutCircleModel alloc] init];
            model.titleString = @"我是标题";
            model.contentString = @"我是内容如adfadsfasdfadsfads我是内容如adfadsfasdfadsfads我是内容如adfadsfasdfadsfads我是内容如adfadsfasdfadsfads我是内容如adfadsfasdfadsfads我是内容如adfadsfasdfadsfads";
            frame.model = model;
            [array addObject:frame];
        }
        
        _midView = [[AboutCircleMidView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_headView.frame), kScreenWidth, 300)aboutCircleFrames:array];
        [self addSubview:_midView];
        
        _bottomView = [[AboutCircleBottomView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_midView.frame), kScreenWidth, 100)];
        [self addSubview:_bottomView];
        
        
    }
    return self;
}

@end
