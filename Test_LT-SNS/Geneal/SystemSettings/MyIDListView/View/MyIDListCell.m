//
//  MyIDListCell.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "MyIDListCell.h"
#import "MyIDListModel.h"

#import "UIImageView+WebCache.h"

#define kMyIDBorderOffset 5
#define kMyIDAvatarWH 40
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kChangeButtonWidth 60
#define kChangeButtonHeight 40
#define kLabelHeight 20
@interface MyIDListCell()

@property(nonatomic,strong)UIImageView *avatarImageView;    //头像ImageView
@property(nonatomic,strong)UILabel *userNameLabel;          //用户名Label
@property(nonatomic,strong)UILabel *fansCountLabel;         //粉丝个数Label
@property(nonatomic,strong)UILabel *concernCountLabel;      //关注个数Label
@property(nonatomic,strong)UIButton *changeIdentityButton;  //修改身份按钮

@property(nonatomic,strong)UILabel *bottomLineLabel;

@end

@implementation MyIDListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kMyIDBorderOffset, kMyIDBorderOffset, kMyIDAvatarWH, kMyIDAvatarWH)];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 10.0f;
        _avatarImageView.layer.borderWidth = 1;
        _avatarImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.contentView addSubview:_avatarImageView];
        
        _changeIdentityButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-kChangeButtonWidth-2*kMyIDBorderOffset, kMyIDBorderOffset, kChangeButtonWidth, kChangeButtonHeight)];
        [_changeIdentityButton setTitle:@"切换" forState:UIControlStateNormal];
        [_changeIdentityButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_changeIdentityButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        _changeIdentityButton.layer.masksToBounds = YES;
        _changeIdentityButton.layer.cornerRadius = 10.0f;
        _changeIdentityButton.layer.borderWidth = 1;
        _changeIdentityButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [_changeIdentityButton addTarget:self action:@selector(changeIdentityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_changeIdentityButton];
        
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame)+kMyIDBorderOffset, kMyIDBorderOffset, CGRectGetMinX(_changeIdentityButton.frame)-CGRectGetMaxX(_avatarImageView.frame)-kMyIDBorderOffset, kLabelHeight)];
        _userNameLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_userNameLabel];
        
        CGFloat labelWidth = 100;
        _fansCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_userNameLabel.frame), CGRectGetMaxY(_userNameLabel.frame), labelWidth, kLabelHeight)];
        _fansCountLabel.font = [UIFont systemFontOfSize:12];
        [_fansCountLabel setTextColor:[UIColor orangeColor]];
        [self.contentView addSubview:_fansCountLabel];
        
        _concernCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_fansCountLabel.frame), CGRectGetMinY(_fansCountLabel.frame), labelWidth, kLabelHeight)];
        _concernCountLabel.font = [UIFont systemFontOfSize:12];
        [_concernCountLabel setTextColor:[UIColor orangeColor]];
        [self.contentView addSubview:_concernCountLabel];
        CGFloat bottomLineHeight = 1;
        _bottomLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMyIDBorderOffset, kMyIDListCellHeight-bottomLineHeight, kScreenWidth-kMyIDBorderOffset, bottomLineHeight)];
        _bottomLineLabel.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.7];
        [self.contentView addSubview:_bottomLineLabel];
    }
    return self;
}

-(void)setMyIDModel:(MyIDListModel *)myIDModel{
    _myIDModel = myIDModel;
    _userNameLabel.text = _myIDModel.userName;
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:_myIDModel.avatarString] placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
    _fansCountLabel.text = [NSString stringWithFormat:@"粉丝:%@",_myIDModel.fansCountString];
    _concernCountLabel.text = [NSString stringWithFormat:@"关注:%@",_myIDModel.concernCountString];
    
    NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserAuthData"];
    NSNumber *index = [userInfo objectForKey:@"index"];
    
    
    NSString *changeButtonTitle = [index isEqualToNumber:_myIDModel.rowNumber] ? @"当前身份":@"切换";
    [_changeIdentityButton setTitle:changeButtonTitle forState:UIControlStateNormal];

}

-(void)changeIdentityButtonClick:(UIButton *)button{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}


@end
