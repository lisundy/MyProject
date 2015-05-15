//
//  LeshiTopView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/21.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "LeshiTopView.h"
#import "LeShiViewModel.h"
#import "UIImageView+WebCache.h"
#import "PersonalInfoViewController.h"

//头像高度
#define KHeight 44
#define KWidth 50
#define KOffset 3

@interface LeshiTopView ()
{
//    UIAlertView *alert;
}
@end

@implementation LeshiTopView

- (id)initWithModel:(LeShiViewModel *)leshiModel
{
    if (self = [super init]) {
        
        [self initComponent];
        _leshiModel = leshiModel;
        
        [self myLayoutSubviews];
    }
    
    return self;
}

#pragma mark -initComponent初始化组件
- (void)initComponent
{
    //头像
    _headImageView = [[UIImageView alloc] init];
    [self addSubview:_headImageView];
    
    //昵称按钮
    _nickBtn = [UIFactory createButtonWithTitle:nil fontSize:15];
    _nickBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_nickBtn addTarget:self action:@selector(touchNick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_nickBtn];
    
    //创建时间
    _createTimeLabel = [UIFactory createLabel:nil fontSize:13];
    [self addSubview:_createTimeLabel];
    
    //评论总数
    _commentCountLabel = [UIFactory createLabel:nil fontSize:13];
    _commentCountLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_commentCountLabel];
    
    _repostCountLabel = [UIFactory createLabel:nil fontSize:13];
    _repostCountLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_repostCountLabel];
    
    _lineLabel = [[UILabel alloc] init];
    _lineLabel.backgroundColor = [UIColor grayColor];
    [self addSubview:_lineLabel];

}


#pragma mark layoutSubviews
- (void)myLayoutSubviews
{
    if (_leshiModel != nil) {
        
        _headImageView.frame = CGRectMake(6, 6, KHeight, KHeight);
        _headImageView.layer.cornerRadius = KHeight/2;
        _headImageView.layer.masksToBounds = YES;
        UIImage *img = [UIImage imageNamed:@"whereToGoImage"];
        
        [_headImageView sd_setImageWithURL:
         [NSURL URLWithString:_leshiModel.userModel.curr_head] placeholderImage:
         img];
        
        _nickBtn.frame = CGRectMake(_headImageView.right + KOffset, _headImageView.top, 100, KHeight/2);
        [_nickBtn setTitle:_leshiModel.userModel.nick forState:UIControlStateNormal];
        
        _createTimeLabel.frame = CGRectMake(_headImageView.right+KOffset, _nickBtn.bottom, 200, KHeight/2);
        
        _createTimeLabel.text  = [NSString stringWithFormat:@"%@ | %@",_leshiModel.create_time,_leshiModel.client];
        
        _commentCountLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - KWidth - 30, _headImageView.top, KWidth, KHeight/2);
        _commentCountLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _commentCountLabel.layer.borderWidth = 0.5;
        _commentCountLabel.layer.cornerRadius = 10;
        _commentCountLabel.layer.masksToBounds = YES;
        
        _commentCountLabel.text  = [NSString stringWithFormat:@"评论:%@",_leshiModel.feedback_count];
        
        _repostCountLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - KWidth - 30, _commentCountLabel.bottom, KWidth, KHeight/2);
        _repostCountLabel.layer.cornerRadius =10;
        _repostCountLabel.layer.borderWidth = 0.5;
        _repostCountLabel.layer.borderColor = [UIColor grayColor].CGColor;
        
        _repostCountLabel.text  = [NSString stringWithFormat:@"转发:%@",_leshiModel.share_count];
        
        _lineLabel.frame = CGRectMake(0, _headImageView.bottom+KOffset, [UIScreen mainScreen].bounds.size.width, 0.3);
        
        _leshiTopviewHeight = _lineLabel.bottom;
    }
}


- (void)toPersonInfo
{
    PersonalInfoViewController *personVC = [[PersonalInfoViewController alloc] initWithPersonHomeID:_leshiModel.userModel.homeID];
    [currentVC presentViewController:personVC animated:YES completion:nil];
}
//点击昵称
- (void)touchNick:(UIButton *)sender
{
    [self toPersonInfo];
}

@end
