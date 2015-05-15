//
//  TopView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "TopView.h"
#import "UIViewExt.h"
#import "UserModel.h"
#import "UIImageView+WebCache.h"

#define KImage 44

@interface TopView ()
{
    UIImageView *headImageView;
    UILabel     *label;
}
@end

@implementation TopView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSDictionary *dic = [userDefault objectForKey:@"UserAuthData"];
        _userModel = [[UserModel alloc] initWithDataDic:dic];
    }
    
    return self;
}

- (void)layoutSubviews
{
    if (nil != _userModel) {
        headImageView = [UIFactory createUserPhoto];
        UIImage *img = [UIImage imageNamed:@"whereToGoImage.png"];
        NSURL *urlPhoto = [NSURL URLWithString:_userModel.curr_head];
        [headImageView sd_setImageWithURL:urlPhoto placeholderImage:img];
        
        label = [UIFactory createLabel:_userModel.nick fontSize:13];
        label.frame = CGRectMake(headImageView.right+10, 10, 200, KImage);
        label.textColor = [UIColor orangeColor];
        
        [self addSubview:headImageView];
        [self addSubview:label];
        
        self.backgroundColor = [UIColor colorWithRed:181.0/255.0 green:198.0/255.0 blue:183.0/255.0 alpha:0.5];
    }
}

@end
