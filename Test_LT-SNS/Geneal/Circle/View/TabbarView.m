//
//  TabbarView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/30.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "TabbarView.h"

@interface TabbarView()
{
    UIButton        *btnJoinedCricle;
    UIButton        *btnCreatedCircle;
    UIButton        *btnCreatingCircle;
}

@end

@implementation TabbarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setComponent];
    }
    
    return self;
}

//
- (void)setComponent
{
    //@"我加入的圈子",@"创建圈子",@"我创建的圈子"
    float screenWidth = [UIScreen mainScreen].bounds.size.width -58;

    btnJoinedCricle = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, screenWidth/2, KTABBARHEIGHT)];
    [btnJoinedCricle addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnJoinedCricle setTitle:@"已经加入的圈子" forState:UIControlStateNormal];
    [btnJoinedCricle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnJoinedCricle.tag = BtnJoinedCircleType;
    [self addSubview:btnJoinedCricle];
    
    btnCreatingCircle = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/2 + 5, 0, 48, KTABBARHEIGHT)];
    [btnCreatingCircle addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnCreatingCircle setBackgroundImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    btnCreatingCircle.tag = BtnCreatingCircleType;
    [self addSubview:btnCreatingCircle];
    
    btnCreatedCircle = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/2 + 5 +48, 0, screenWidth/2, KTABBARHEIGHT)];
    [btnCreatedCircle addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnCreatedCircle setTitle:@"已经创建的圈子" forState:UIControlStateNormal];
    [btnCreatedCircle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnCreatedCircle.tag = BtnCreatedCircleType;
    [self addSubview:btnCreatedCircle];
    
    self.backgroundColor = [UIColor orangeColor];
    
}

- (void)buttonClick:(UIButton *)sender
{
    NSInteger type = sender.tag;
    
    
    [self.delegate selected:type];
}

@end
