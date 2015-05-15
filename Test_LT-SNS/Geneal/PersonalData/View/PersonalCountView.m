//
//  PersonalCountView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalCountView.h"
#import "PersonalCountModel.h"
@interface PersonalCountView()

@property(nonatomic,strong)UILabel *pointsLabel;        //积分label
@property(nonatomic,strong)UILabel *tuoCoinLabel;       //驼币数label
@property(nonatomic,strong)UILabel *shareCountLabel;    //分享数label


@end

@implementation PersonalCountView

- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat border = 5;
        CGFloat labelHeight = 30;
        _pointsLabel = [[UILabel alloc] initWithFrame:CGRectMake(border, border, kScreenWidth-2*border, labelHeight)];
        _pointsLabel.text = @"   积分:0";
        _pointsLabel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_pointsLabel];
        
        _tuoCoinLabel = [[UILabel alloc] initWithFrame:CGRectMake(border, CGRectGetMaxY(_pointsLabel.frame)+2*border, kScreenWidth-2*border, labelHeight)];
        _tuoCoinLabel.text = @"   驼币:0";
        _tuoCoinLabel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_tuoCoinLabel];
        
        _shareCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(border, CGRectGetMaxY(_tuoCoinLabel.frame)+2*border, kScreenWidth-2*border, labelHeight)];
        _shareCountLabel.text = @"   分享:0";
        _shareCountLabel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_shareCountLabel];
        
        _personalCountViewHeight = CGRectGetMaxY(_shareCountLabel.frame);
    }
    return self;
}

-(void)setPersonalCountModel:(PersonalCountModel *)personalCountModel{
    _personalCountModel = personalCountModel;
    
    _pointsLabel.text = [NSString stringWithFormat:@"   积分:%@",_personalCountModel.pointsCountString];
    _tuoCoinLabel.text = [NSString stringWithFormat:@"   驼币:%@",_personalCountModel.tuoCoinCountString];
    _shareCountLabel.text = [NSString stringWithFormat:@"   分享:%@",_personalCountModel.shareCountString];
}

@end
