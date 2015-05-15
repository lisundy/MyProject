//
//  PersonalIntroductionView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalIntroductionView.h"
#import "PersonalIntroductionModel.h"
#import "UIImageView+WebCache.h"
#define kBorder 5
#define kAvatarWH 60

@interface PersonalIntroductionView ()

@property(nonatomic,strong)UIImageView *avatarImageView;
@property(nonatomic,strong)UIImageView *sexImageView;
@property(nonatomic,strong)UILabel *userNameLabel;
@property(nonatomic,strong)UIButton *editButton;
@property(nonatomic,strong)UILabel *homeIdLabel;
@property(nonatomic,strong)UIImageView *localeImageView;
@property(nonatomic,strong)UILabel *localeLabel;
@property(nonatomic,strong)UILabel *xinqingLabel;

@end

@implementation PersonalIntroductionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kBorder, kBorder, kAvatarWH, kAvatarWH)];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 10.0f;
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_avatarImageView];
        
        CGFloat editButtonWidth = 70;
        CGFloat editButtonHeight = 30;
        _editButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-editButtonWidth-kBorder, kBorder, editButtonWidth, editButtonHeight)];
        [_editButton setTitle:@"编辑" forState:UIControlStateNormal];
        [_editButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _editButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _editButton.layer.masksToBounds = YES;
        _editButton.layer.cornerRadius = 10.0f;
        _editButton.layer.borderWidth = 1;
        _editButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [_editButton addTarget:self action:@selector(editButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_editButton];
        CGFloat localImageViewW = 9;
        CGFloat localImageViewH = 30;
        _localeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_editButton.frame), CGRectGetMaxY(_editButton.frame)+kBorder, localImageViewW, localImageViewH)];
        _localeImageView.contentMode = UIViewContentModeScaleAspectFit;
        [_localeImageView setImage:[UIImage imageNamed:@"dingwei_244_77_9_15"]];
        [self addSubview:_localeImageView];
        
        _localeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_localeImageView.frame), CGRectGetMaxY(_editButton.frame)+kBorder, editButtonWidth-kBorder-localImageViewW, 30)];
        _localeLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_localeLabel];
        
        CGFloat sexImageViewW = 11 ;
        CGFloat sexImageViewH = 30;
        _sexImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame)+2*kBorder, kBorder, sexImageViewW, sexImageViewH)];
        _sexImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_sexImageView];
        
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_sexImageView.frame)+kBorder, kBorder, CGRectGetMinX(_editButton.frame)-CGRectGetMaxX(_avatarImageView.frame)-kBorder, 30)];
        _userNameLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_userNameLabel];
        
        _homeIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_sexImageView.frame), CGRectGetMaxY(_sexImageView.frame)+kBorder, sexImageViewW+kBorder+CGRectGetWidth(_userNameLabel.frame), CGRectGetHeight(_userNameLabel.frame))];
        _homeIdLabel.font = [UIFont systemFontOfSize:13];
        
        [self addSubview:_homeIdLabel];

    }
    return self;
}

-(void)setPersonalIntroductionModel:(PersonalIntroductionModel *)personalIntroductionModel{
    _personalIntroductionModel = personalIntroductionModel;
    
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:_personalIntroductionModel.currentHead] placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
    if([_personalIntroductionModel.sex isEqualToString:@"男"]){
        _sexImageView.image = [UIImage imageNamed:@"man_75_44_11_16"];
    }else{
        _sexImageView.image = [UIImage imageNamed:@"girl_75_44_11_16"];
    }
    _userNameLabel.text = _personalIntroductionModel.nickName;
    _homeIdLabel.text = [NSString stringWithFormat:@"身份ID: %@",_personalIntroductionModel.homeId];
    _localeLabel.text = [NSString stringWithFormat:@"%@ %@",_personalIntroductionModel.province,_personalIntroductionModel.city];
    
    CGFloat lineHeight = 1;
    CGFloat myHeight = CGRectGetMaxY(_homeIdLabel.frame)+kBorder;
    NSString *string = [personalIntroductionModel.xinqing stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (!([string isEqualToString:@""]||string==nil)) {
        CGFloat offset = 20;
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(offset, CGRectGetMaxY(_homeIdLabel.frame)+kBorder, kScreenWidth-offset, lineHeight)];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineLabel];
        
        UIFont *xinqingFont = [UIFont systemFontOfSize:14];
        CGFloat number = 4;     //距离kBorder的倍数。为4，则左右距边界2*kBorder
        CGSize xinqingLabelSize = [_personalIntroductionModel.xinqing sizeWithFont:xinqingFont constrainedToSize:CGSizeMake(kScreenWidth-number*kBorder, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        
        UILabel *xinqingLabel = [[UILabel alloc] initWithFrame:CGRectMake(number/2 * kBorder, CGRectGetMaxY(lineLabel.frame)+kBorder, xinqingLabelSize.width, xinqingLabelSize.height)];
        xinqingLabel.numberOfLines = 0;
        xinqingLabel.font = xinqingFont;
        xinqingLabel.text = _personalIntroductionModel.xinqing;
        [self addSubview:xinqingLabel];
        
        myHeight = CGRectGetMaxY(xinqingLabel.frame)+kBorder;
    }
    
    UILabel *viewBottomLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, myHeight-lineHeight, kScreenWidth, lineHeight)];
    viewBottomLineLabel.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:viewBottomLineLabel];
    
    _introductionViewHeight = CGRectGetMaxY(viewBottomLineLabel.frame);
    
}

-(void)editButtonClick:(UIButton *)button{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationNamePersonalIntroductionEditButtonClick object:nil userInfo:@{@"controllerName":@"EditPersonalViewController"}];
    
}

@end
