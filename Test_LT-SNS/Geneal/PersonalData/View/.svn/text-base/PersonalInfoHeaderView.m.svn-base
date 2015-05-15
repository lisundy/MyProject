//
//  PersonalInfoHeaderView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/29.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalInfoHeaderView.h"

#import "PersonalIntroductionModel.h"

#import "UIImageView+WebCache.h"

#define kOffset 10

@interface PersonalInfoHeaderView ()

@property(nonatomic,strong)UIImageView *avatarImageView;    //头像ImageView
@property(nonatomic,strong)UILabel *nameLabel;              //用户名Label
@property(nonatomic,strong)UIImageView *sexImageView;       //性别图标ImageView
@property(nonatomic,strong)UILabel *homeIdLabel;            //身份IDLabel
@property(nonatomic,strong)UIButton *concernButton;         //关注按钮
@property(nonatomic,strong)UIImageView *locationImageView;  //定位ImageView
@property(nonatomic,strong)UILabel *locationNameLabel;      //定位地点Label
@property(nonatomic,strong)UILabel *xinqingLabel;           //心情Label

@property(nonatomic,strong)UIView *fansBGView;              //粉丝背景View
@property(nonatomic,strong)UILabel *fansCountKeyLabel;      //粉丝数量名称Label
@property(nonatomic,strong)UILabel *fansCountValueLabel;    //粉丝数量数值Label

@property(nonatomic,strong)UIView *concernBGView;           //关注背景View
@property(nonatomic,strong)UILabel *concernCountKeyLabel;   //关注数量名称Label
@property(nonatomic,strong)UILabel *concernCountValueLabel; //关注数量数值Label

@property(nonatomic,copy)NSMutableArray *leshiImages;
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation PersonalInfoHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat viewWidth = CGRectGetWidth(frame);
        
        CGFloat avatarWH = viewWidth * 0.16;
        
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kOffset, kOffset, avatarWH, avatarWH)];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 10.f;
        [self addSubview:_avatarImageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame)+kOffset, kOffset, viewWidth*0.25, avatarWH/3)];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_nameLabel];
        
        
        UIImage *sexImage = [UIImage imageNamed:@"girl_75_44_11_16"];
        CGSize sexImageSize = [sexImage size];
        _sexImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_nameLabel.frame)+kOffset, CGRectGetMidY(_nameLabel.frame)-sexImageSize.height/4, sexImageSize.width/2, sexImageSize.height/2)];
        _sexImageView.image = sexImage;
        [self addSubview:_sexImageView];
        
        _homeIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame)+kOffset, CGRectGetMaxY(_nameLabel.frame), CGRectGetMaxX(_sexImageView.frame)-CGRectGetMinX(_nameLabel.frame), avatarWH/3)];
        _homeIdLabel.font = [UIFont systemFontOfSize:12];
        _homeIdLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_homeIdLabel];
        
        UIImage *concernImage = [UIImage imageNamed:@"jiaguanzhu"];
        CGSize concernImageSize = [concernImage size];
        _concernButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame)+kOffset, CGRectGetMaxY(_homeIdLabel.frame), concernImageSize.width/2, concernImageSize.height/2)];
        [_concernButton setBackgroundImage:concernImage forState:UIControlStateNormal];
        [self addSubview:_concernButton];
        
        UIImage *locationImage = [UIImage imageNamed:@"dingwei_244_77_9_15"];
        CGSize locationImageSize = [locationImage size];
        _locationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_concernButton.frame)+kOffset, CGRectGetMidY(_concernButton.frame)-locationImageSize.height/4, locationImageSize.width/2, locationImageSize.height/2)];
        _locationImageView.image = locationImage;
        [self addSubview:_locationImageView];
        
        _locationNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_locationImageView.frame)+kOffset/2, CGRectGetMinY(_concernButton.frame), viewWidth*0.12, avatarWH/3)];
        _locationNameLabel.text = @"广东";
        _locationNameLabel.font = [UIFont systemFontOfSize:12];
        _locationNameLabel.textColor = [UIColor orangeColor];
        [self addSubview:_locationNameLabel];
        
        CGFloat bgViewWH = viewWidth * 0.14;
        _fansBGView = [[UIView alloc] initWithFrame:CGRectMake(MAX(CGRectGetMaxX(_locationNameLabel.frame)+kOffset, CGRectGetMaxX(_homeIdLabel.frame)), CGRectGetMidY(_avatarImageView.frame)-bgViewWH/2, bgViewWH, bgViewWH)];
        _fansBGView.layer.borderWidth = 1;
        _fansBGView.layer.borderColor = [UIColor blackColor].CGColor;
        _fansBGView.layer.masksToBounds = YES;
        _fansBGView.layer.cornerRadius = 10.f;
        [self addSubview:_fansBGView];
        
        UIFont *font = [UIFont systemFontOfSize:12];
        NSString *fansCountKey = @"粉丝数";
        CGSize fansKeySize = [fansCountKey sizeWithFont:font];
        
        _fansCountKeyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_fansBGView.frame)-fansKeySize.height-kOffset, bgViewWH, fansKeySize.height+kOffset)];
        _fansCountKeyLabel.text = fansCountKey;
        _fansCountKeyLabel.font = font;
        _fansCountKeyLabel.textAlignment = NSTextAlignmentCenter;
        [_fansBGView addSubview:_fansCountKeyLabel];
        
        _fansCountValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bgViewWH, CGRectGetMaxY(_fansCountKeyLabel.frame)-fansKeySize.height-kOffset)];
        _fansCountValueLabel.font = font;
        _fansCountValueLabel.textAlignment = NSTextAlignmentCenter;
        [_fansBGView addSubview:_fansCountValueLabel];
        
        _concernBGView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_fansBGView.frame)+kOffset, CGRectGetMinY(_fansBGView.frame), bgViewWH, bgViewWH)];
        _concernBGView.layer.borderWidth = 1;
        _concernBGView.layer.borderColor = [UIColor blackColor].CGColor;
        _concernBGView.layer.masksToBounds = YES;
        _concernBGView.layer.cornerRadius = 10.f;
        [self addSubview:_concernBGView];
        
        _concernCountKeyLabel = [[UILabel alloc] initWithFrame:_fansCountKeyLabel.frame];
        _concernCountKeyLabel.text = @"关注数";
        _concernCountKeyLabel.font = font;
        _concernCountKeyLabel.textAlignment = NSTextAlignmentCenter;
        [_concernBGView addSubview:_concernCountKeyLabel];
        
        _concernCountValueLabel = [[UILabel alloc] initWithFrame:_fansCountValueLabel.frame];
        _concernCountValueLabel.font = font;
        _concernCountValueLabel.textAlignment = NSTextAlignmentCenter;
        [_concernBGView addSubview:_concernCountValueLabel];
        
        
        
    }
    return self;
}


-(void)setPersonalIntroductionModel:(PersonalIntroductionModel *)personalIntroductionModel{
    _personalIntroductionModel = personalIntroductionModel;
    
    _nameLabel.text = _personalIntroductionModel.nickName;
    _locationNameLabel.text = _personalIntroductionModel.province;
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:_personalIntroductionModel.currentHead] placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
    _homeIdLabel.text = [NSString stringWithFormat:@"身份ID:%@",_personalIntroductionModel.homeId];
    
    NSString *sexImageString = [_personalIntroductionModel.sex isEqualToString:@"男"]?@"man_75_44_11_16":@"girl_75_44_11_16";
    _sexImageView.image = [UIImage imageNamed:sexImageString];
    
    NSString *concernBtnImageString = _personalIntroductionModel.concern?@"yiguanzhu":@"jiaguanzhu";
    [_concernButton setBackgroundImage:[UIImage imageNamed:concernBtnImageString] forState:UIControlStateNormal];
    
    _fansCountValueLabel.text = _personalIntroductionModel.fansCountString;
    _concernCountValueLabel.text = _personalIntroductionModel.concernCountString;
    
    NSString *string = [_personalIntroductionModel.xinqing stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //如果心情不为空
    if (!([string isEqualToString:@""] || string == nil)) {
        _xinqingLabel = [[UILabel alloc] initWithFrame:CGRectMake(kOffset, CGRectGetMaxY(_avatarImageView.frame)+kOffset, CGRectGetWidth(self.frame)-2*kOffset, 25)];
        _xinqingLabel.text = [NSString stringWithFormat:@"心情:%@",_personalIntroductionModel.xinqing];
        _xinqingLabel.textAlignment = NSTextAlignmentLeft;
        _xinqingLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_xinqingLabel];
        _headerViewHeight = CGRectGetMaxY(_xinqingLabel.frame)+kOffset;
    }else{      //如果心情为空
        _headerViewHeight = CGRectGetMaxY(_avatarImageView.frame)+kOffset;
    }
    
    _leshiImages = [_personalIntroductionModel.thumbPhotos mutableCopy];
    //如果图片不为空
    if (_leshiImages.count>0) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _headerViewHeight, CGRectGetWidth(self.frame), 70)];
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
        CGFloat imageViewWH = 50;
        CGRect lastRect = CGRectZero;
        //遍历图片，放入scrollview
        for (NSInteger i = 0; i<_leshiImages.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_leshiImages objectAtIndex:i]]];
            imageView.frame = CGRectMake((i+1)*kOffset + i*imageViewWH, kOffset, imageViewWH, imageViewWH);
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [imageView sd_setImageWithURL:[NSURL URLWithString:[_leshiImages objectAtIndex:i]]];
            [_scrollView addSubview:imageView];
            lastRect = imageView.frame;
        }
        
        //设置scrollview内容大小
        if (CGRectGetMaxX(lastRect)>CGRectGetMaxX(self.frame)) {
            _scrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastRect), 70);
        }else{
            _scrollView.contentSize = CGSizeMake(CGRectGetMaxX(self.frame)+1, 70);
        }
        
        _headerViewHeight = CGRectGetMaxY(_scrollView.frame);
    }
    
    //下划线label
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _headerViewHeight-1, CGRectGetWidth(self.frame), 1)];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lineLabel];
    
}


@end
