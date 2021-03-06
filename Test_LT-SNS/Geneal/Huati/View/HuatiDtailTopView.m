//
//  HuatiDtailTopView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/17.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HuatiDtailTopView.h"
#import "HuaTiViewModel.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "PersonalInfoViewController.h"

@interface HuatiDtailTopView ()

@property (retain, nonatomic) HuaTiViewModel *huatiModel;

@end

@implementation HuatiDtailTopView

#pragma mark initWithUserModel
- (id)initWithModel:(HuaTiViewModel *)huatiModel
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"HuatiDtailTopView" owner:self options:nil] lastObject];
    if (self) {
        
        _huatiModel = huatiModel;
        [self myLayoutSubviews];
    }
    
    return self;
}

#pragma mark layoutsubviews
- (void)myLayoutSubviews
{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, KTopViewH);
    //填充数据 start
    [_headImagView sd_setImageWithURL:[NSURL URLWithString:_huatiModel.userModel.curr_head] placeholderImage:
     [UIImage imageNamed:@"whereToGoImage"]];
    _headImagView.layer.cornerRadius = _headImagView.width/2;
    _headImagView.layer.masksToBounds = YES;
    
    [_nickBtn setTitle:_huatiModel.userModel.nick forState:UIControlStateNormal];
    _titleLabel.text = _huatiModel.title;
    _titleLabel.textColor = [UIColor redColor];
    
    _timeLabel.text = _huatiModel.create_time;
    _fromLabel.text = _huatiModel.from;
    //end
    UILabel *_line = [[UILabel alloc] initWithFrame:CGRectMake(0, self.timeLabel.bottom+1, self.width, 0.05)];
    _line.backgroundColor = [UIColor grayColor];
    [self addSubview:_line];
    _topViewBottom = self.bottom;
}

#pragma mark 
- (void)toPersonInfo
{
    PersonalInfoViewController *personVC = [[PersonalInfoViewController alloc]
                                            initWithPersonHomeID:_huatiModel.userModel.homeID];
    [currentVC presentViewController:personVC animated:YES completion:nil];
}
//点击昵称响应操作
- (IBAction)tochNick:(id)sender {
    [self toPersonInfo];
}
@end
