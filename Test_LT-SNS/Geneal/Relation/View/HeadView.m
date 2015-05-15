
//
//  HeadView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HeadView.h"

#define KHeadViewH 44

@interface HeadView ()
{
    UILabel *lineLabel;
    UIButton *touchBtn;
}

@end

@implementation HeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initComponent];
    }
    return self;
}

- (void)initComponent
{
    touchBtn = [[UIButton alloc] init];
    [touchBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [touchBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    touchBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:touchBtn];
    
    lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = [UIColor grayColor];
    [self addSubview:lineLabel];
}

#pragma mark  该方法自动调用
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    touchBtn.frame = CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width - 10-25, 34);
    
    [touchBtn setTitle:_groupName forState:UIControlStateNormal];
    
    lineLabel.frame = CGRectMake(0, KHeadViewH - 0.5, [UIScreen mainScreen].bounds.size.width, 0.5);
}

#pragma mark buttonClick
-(void)buttonClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(selected:)]) {
        
        [self.delegate selected:self];
    }
}

#pragma mark 利用重用机制创建
+(instancetype)headerWithTableView:(UITableView *)tableView
{
    static NSString *headerView = @"headerView";
    
    HeadView *_headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerView];
    if (_headView == nil) {
        
        _headView = [[HeadView alloc] initWithReuseIdentifier:headerView];
    }
    
    return _headView;
}


@end
