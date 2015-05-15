//
//  BaseNavigationView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/9.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseNavigationView.h"

#define kNavigationFontSize 17

@interface BaseNavigationView()

@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation BaseNavigationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置导航栏透明度为0.8
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
        
        //新建导航栏中的标题Label
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:kNavigationFontSize];
        [self addSubview:_titleLabel];
        
        
    }
    return self;
}

-(void)setLeftButton:(UIButton *)leftButton{
    _leftButton = leftButton;
    
    _leftButton.frame = CGRectMake(0, kStatusBarHeight, leftButton.bounds.size.width, leftButton.bounds.size.height);
    [self addSubview:_leftButton];
}


- (void)setRightButton:(UIButton *)rightButton
{
    _rightButton = rightButton;
    _rightButton.frame = CGRectMake(self.frame.size.width - rightButton.bounds.size.width, kStatusBarHeight, rightButton.bounds.size.width, rightButton.bounds.size.height);
    [self addSubview:_rightButton];
}


//重写set方法，设置导航栏的标题
-(void)setNavigationTitle:(NSString *)navigationTitle{
    
    _navigationTitle = navigationTitle;
    
    _titleLabel.text = _navigationTitle;
    
    //计算传入导航栏标题的长度，改变标题label的Frame
    CGSize size = [_navigationTitle sizeWithFont:[UIFont systemFontOfSize:kNavigationFontSize]];
    _titleLabel.frame = CGRectMake(self.center.x-size.width/2, kStatusBarHeight, size.width, kNavigationBarHeight);
}

@end
