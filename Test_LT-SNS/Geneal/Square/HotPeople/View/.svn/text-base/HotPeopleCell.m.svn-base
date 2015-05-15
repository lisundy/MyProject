//
//  HotPeopleCell.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/24.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HotPeopleCell.h"
#import "HotPeopleModel.h"
#import "UIImageView+WebCache.h"


@interface HotPeopleCell ()

@property(nonatomic,strong)UIImageView *avatarImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *fansCountLabel;
@property(nonatomic,strong)UIImageView *sexImageView;
@property(nonatomic,strong)UIButton *isConcernButton;

@end

@implementation HotPeopleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat border = 10;
        
        CGFloat avatarWH = (screenWidth-2*border)*0.12;
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(border, (CGFloat)kHotPeopleCellHeight/2.0-avatarWH/2, avatarWH, avatarWH)];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_avatarImageView];
        
        CGFloat labelWidth = (screenWidth-2*border)*0.45;
        CGFloat labelHeight = 20;
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame)+border, border, labelWidth, labelHeight)];
        [self.contentView addSubview:_nameLabel];
        
        _fansCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(_nameLabel.frame), labelWidth, labelHeight)];
        _fansCountLabel.font = [UIFont systemFontOfSize:13];
        _fansCountLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_fansCountLabel];
        
        CGFloat sexImageWH = (screenWidth-2*border)*0.05;
        _sexImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_nameLabel.frame), kHotPeopleCellHeight/2-sexImageWH/2, sexImageWH, sexImageWH)];
        _sexImageView.contentMode = UIViewContentModeScaleAspectFit;
        [_sexImageView setImage:[UIImage imageNamed:@"man_75_44_11_16"]];
        [self.contentView addSubview:_sexImageView];
        
        CGSize buttonImageSize = [UIImage imageNamed:@"jiaguanzhu"].size;
        _isConcernButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonImageSize.width/2, buttonImageSize.height/2)];
        [_isConcernButton setBackgroundImage:[UIImage imageNamed:@"jiaguanzhu"] forState:UIControlStateNormal];
        [_isConcernButton addTarget:self action:@selector(concernButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.accessoryView = _isConcernButton;
    }
    return self;
}

-(void)concernButtonClick:(UIButton *)concernButton{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"你点击了按钮" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alert show];
}

-(void)setHotPeopleModel:(HotPeopleModel *)hotPeopleModel{
    _hotPeopleModel = hotPeopleModel;
    
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:_hotPeopleModel.avatarString] placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
   
    _nameLabel.text = _hotPeopleModel.userName;
    _fansCountLabel.text = [NSString stringWithFormat:@"粉丝数:%@",_hotPeopleModel.fansCountString];
    
    NSString *imageName = _hotPeopleModel.genderType == GenderTypeMale?@"man_75_44_11_16":@"girl_75_44_11_16";
    _sexImageView.image = [UIImage imageNamed:imageName];
    
    NSString *buttonImageName = _hotPeopleModel.isConcern?@"jiaguanzhu":@"yiguanzhu";
    [_isConcernButton setBackgroundImage:[UIImage imageNamed:buttonImageName] forState:UIControlStateNormal];
    
    
}


@end
