//
//  LeftMenuHeadView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/5/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "LeftMenuHeadView.h"
#import "UIImageView+WebCache.h"
#import "UserModel.h"
#import "PersonalInfoViewController.h"

@interface LeftMenuHeadView ()
{
    UserModel *userModel;
}
@end

@implementation LeftMenuHeadView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self myLayoutSubviews];
    }
    return self;
}

- (void)myLayoutSubviews
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefault objectForKey:@"UserAuthData"];//curr_head
    userModel = [[UserModel alloc] initWithDataDic:dic];
    
    //CGRectMake(70, 1, 44, 44)
    UIImageView *photo = [UIFactory createUserPhoto];
    photo.frame = CGRectMake(68, 1, 44, 44);
    
    UIButton *btnPhoto = [[UIButton alloc] initWithFrame:CGRectMake(68, 1, 44, 44)];
    btnPhoto.backgroundColor = [UIColor clearColor];
    btnPhoto.userInteractionEnabled = YES;
    [btnPhoto addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [photo sd_setImageWithURL:[NSURL URLWithString:userModel.curr_head]
             placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
    
    //CGRectMake(0, 41, 180, 10)
    UILabel *nickLabel = [UIFactory createLabel:userModel.nick fontSize:10];
    nickLabel.frame = CGRectMake(0, 45, 180, 10);
    nickLabel.text = userModel.nick;
    nickLabel.textAlignment = NSTextAlignmentCenter;
    nickLabel.textColor = [UIColor blackColor];
    nickLabel.layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self addSubview:nickLabel];
    [self addSubview:photo];
    [self addSubview:btnPhoto];
    self.frame = CGRectMake(20, 100, 180, 56);
    self.layer.backgroundColor = [UIColor orangeColor].CGColor;
}

- (void)btnClick:(UIButton *)sender
{
    PersonalInfoViewController *personVC = [[PersonalInfoViewController alloc]
                                            initWithPersonHomeID:userModel.homeID];
    [self.delegate goPersonInfo:personVC];
}

@end
