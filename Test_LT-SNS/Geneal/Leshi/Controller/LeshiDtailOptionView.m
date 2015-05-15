//
//  LeshiDtailOptionView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/16.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "LeshiDtailOptionView.h"

@implementation LeshiDtailOptionView


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
    
    _btnFlash     = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, KBtn_Height)];
    _btnFlash.tag = 1;
    [_btnFlash.layer setCornerRadius:0.8];
    [_btnFlash.layer setBorderColor:[UIColor redColor].CGColor];
    [_btnFlash addTarget:self action:@selector(doButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btnFlash setTitle:@"刷新" forState:UIControlStateNormal];
    [_btnFlash setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _btnFlash.backgroundColor = [UIColor clearColor];
    [self addSubview:_btnFlash];
    
    _btnAnswer    = [[UIButton alloc] initWithFrame:CGRectMake(btn_width * 1, 0, btn_width, KBtn_Height)];
    _btnAnswer.tag = 2;
    [_btnAnswer addTarget:self action:@selector(doButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btnAnswer setTitle:@"回复" forState:UIControlStateNormal];
    [_btnAnswer setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _btnAnswer.backgroundColor = [UIColor clearColor];
    [self addSubview:_btnAnswer];
    
    _btnRepost    = [[UIButton alloc] initWithFrame:CGRectMake(btn_width * 2, 0, btn_width, KBtn_Height)];
    _btnRepost.tag = 3;
    [_btnRepost addTarget:self action:@selector(doButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btnRepost setTitle:@"转发" forState:UIControlStateNormal];
    [_btnRepost setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:_btnRepost];
    
    _btnShare     = [[UIButton alloc] initWithFrame:CGRectMake(btn_width * 3, 0, btn_width, KBtn_Height)];
    _btnShare.tag = 4;
    [_btnShare addTarget:self action:@selector(doButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btnShare setTitle:@"分享" forState:UIControlStateNormal];
    [_btnShare setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:_btnShare];

    _btnStore     = [[UIButton alloc] initWithFrame:CGRectMake(btn_width * 4, 0, btn_width, KBtn_Height)];
    _btnStore.tag = 5;
    [_btnStore addTarget:self action:@selector(doButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btnStore setTitle:@"收藏" forState:UIControlStateNormal];
    [_btnStore setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:_btnStore];
}

#pragma mark 按钮响应
- (void)doButtonAction:(UIButton *)sender
{
    int tag = sender.tag;
    
    switch (tag) {
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        default:
            break;
    }
    NSLog(@"%@",sender.titleLabel.text);
}

@end
