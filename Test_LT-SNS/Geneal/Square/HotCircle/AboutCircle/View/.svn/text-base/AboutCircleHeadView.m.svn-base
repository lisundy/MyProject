//
//  AboutCircleHeadView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "AboutCircleHeadView.h"

@interface AboutCircleHeadView ()

@property(nonatomic,strong)UIImageView *avatarImageView;
@property(nonatomic,strong)UILabel *circleNameLabel;
@property(nonatomic,strong)UIButton *joinButton;

@end

@implementation AboutCircleHeadView

- (instancetype)initWithFrame:(CGRect)frame AvatarString:(NSString *)avatarString CircleName:(NSString *)circleName
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat viewWidth = CGRectGetWidth(frame);
        CGFloat viewHeight = CGRectGetHeight(frame);
        CGFloat offset = 10;
        CGFloat avatarWH = viewWidth * 0.15;
        
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(offset, viewHeight/2-avatarWH/2, avatarWH, avatarWH)];
        //
        _avatarImageView.image = [UIImage imageNamed:@"avatar"];
        //
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 10.0f;
        [self addSubview:_avatarImageView];
        
        _circleNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame)+offset, CGRectGetMinY(_avatarImageView.frame), viewWidth * 0.6, avatarWH/2)];
        //
        _circleNameLabel.text = @"我是圈子名";
        //
        [self addSubview:_circleNameLabel];
        
        //join_btn
        _joinButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame)+offset, CGRectGetMaxY(_circleNameLabel.frame), 60, avatarWH/2)];
        [_joinButton setBackgroundImage:[UIImage imageNamed:@"join_btn"] forState:UIControlStateNormal];
        [self addSubview:_joinButton];
        
    }
    return self;
}


@end
