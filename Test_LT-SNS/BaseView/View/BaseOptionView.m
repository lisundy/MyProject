//
//  BaseOptionView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/17.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseOptionView.h"

@implementation BaseOptionView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        [self loadSubViews];
    }
    
    return self;
}

#pragma mark loadSubViews
- (void)loadSubViews
{
    CGSize viewSize = self.frame.size;
    
    float btn_width = viewSize.width/5;
    UIFont *font = [UIFont fontWithName:@"隶书" size:11];
    
    self.layer.cornerRadius = 20;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _btnFlash     = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, KOptionH)];
    _btnFlash.tag = 1001;
    [_btnFlash addTarget:self action:@selector(doButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _btnFlash.titleLabel.font = font;
    [_btnFlash setTitle:@"刷新" forState:UIControlStateNormal];
    [_btnFlash setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    _btnFlash.backgroundColor = [UIColor clearColor];
    [self addSubview:_btnFlash];
    
    _btnAnswer    = [[UIButton alloc] initWithFrame:CGRectMake(btn_width * 1, 0, btn_width, KOptionH)];
    _btnAnswer.tag = 1002;
    [_btnAnswer addTarget:self action:@selector(doButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _btnAnswer.titleLabel.font = font;
    [_btnAnswer setTitle:@"回复" forState:UIControlStateNormal];
    [_btnAnswer setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    _btnAnswer.backgroundColor = [UIColor clearColor];
    [self addSubview:_btnAnswer];
    
    _btnRepost    = [[UIButton alloc] initWithFrame:CGRectMake(btn_width * 2, 0, btn_width, KOptionH)];
    _btnRepost.tag = 1003;
    [_btnRepost addTarget:self action:@selector(doButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _btnRepost.titleLabel.font = font;
    [_btnRepost setTitle:@"转发" forState:UIControlStateNormal];
    [_btnRepost setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self addSubview:_btnRepost];
    
    _btnShare     = [[UIButton alloc] initWithFrame:CGRectMake(btn_width * 3, 0, btn_width, KOptionH)];
    _btnShare.tag = 1004;
    [_btnShare addTarget:self action:@selector(doButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _btnShare.titleLabel.font = font;
    [_btnShare setTitle:@"分享" forState:UIControlStateNormal];
    [_btnShare setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self addSubview:_btnShare];
    
    _btnStore     = [[UIButton alloc] initWithFrame:CGRectMake(btn_width * 4, 0, btn_width, KOptionH)];
    _btnStore.tag = 1005;
    [_btnStore addTarget:self action:@selector(doButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _btnStore.titleLabel.font = font;
    [_btnStore setTitle:@"收藏" forState:UIControlStateNormal];
    [_btnStore setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self addSubview:_btnStore];
    
    
}

#pragma mark 按钮响应
- (void)doButtonAction:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    [self.delegate optionwith:tag];
}

@end
