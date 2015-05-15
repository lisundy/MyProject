//
//  DialogView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "DialogView.h"
#import "RelationModel.h"
#import "RelatedPersonCell.h"
#import "RelationViewController.h"

#define KDIALOGHEIGHT 100
#define KDIALOGWIDTH  200

@interface DialogView ()
{
    UIWindow    *modelWindow;
    UIWindow    *keyWindow;
    UILabel     *nickLabel;
    UILabel     *lineLabel;
    UIButton    *delBtn;
    
    CGSize      screenSize;
}
@end

@implementation DialogView

- (instancetype)initWithModel:(RelationModel *)model;
{
    self = [super init];
    if (self) {
        _model = model;
        [self initComponent];
    }
    return self;
}

- (void)initComponent
{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    _dialogView = [[BaseView alloc] initWithFrame:
                   CGRectMake((SCREEN_WIDTH - KDIALOGWIDTH)/2, (SCREEN_HEIGHT - KDIALOGHEIGHT)/2, KDIALOGWIDTH, KDIALOGHEIGHT)];
    _dialogView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_dialogView];
    
    //操作框
    nickLabel = [UIFactory createLabel:nil fontSize:13];
    [_dialogView addSubview:nickLabel];
    
    lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = [UIColor grayColor];
    [_dialogView addSubview:lineLabel];
    
    delBtn = [UIFactory createButtonWithTitle:nil fontSize:15];
    [delBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [delBtn addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    [_dialogView addSubview:delBtn];
    [self myLayoutSubviews];
}

- (void)myLayoutSubviews
{
    _dialogView.layer.borderWidth = 0.3;
    _dialogView.layer.borderColor = [UIColor grayColor].CGColor;
    _dialogView.layer.masksToBounds = YES;
    
    nickLabel.frame = CGRectMake(10, 5, KDIALOGWIDTH - 20, KDIALOGHEIGHT/2 - 20);
    nickLabel.text  = _model.nick;
    
    lineLabel.frame = CGRectMake(5, nickLabel.bottom, KDIALOGWIDTH - 10, 0.5);
    
    delBtn.frame    = CGRectMake(10, lineLabel.bottom, KDIALOGWIDTH - 20, KDIALOGWIDTH/2-20 - 0.5);
    [delBtn setTitle:@"确定移除吗？" forState:UIControlStateNormal];
}

//显示操作框
- (void)show
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1.0;
        self.dialogView.alpha = 1.0;
        
    } completion:nil];
}

//淡出操作框
- (void)dismiss:(BOOL)animated
{
    if (self) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.alpha = 0;
                         }completion:^(BOOL finished){
                             [self removeFromSuperview];
                         }];
    }
}

//删除一个好友的操作
- (void)delete:(UIButton *)sender
{
    [self.delegate removeRelation:_cell];
}

@end
