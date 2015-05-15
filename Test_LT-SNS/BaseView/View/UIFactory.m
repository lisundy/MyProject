//
//  UIFactory.m
//  Test_LT-SNS
//
//  Created by pactera on 15/5/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "UIFactory.h"

#define KUSERPHOTO_WIDTH_HEIGHT 44
#define KFontName @"Helvetica"

@interface UIFactory ()
{
    
}
@end

static UIFactory *factory;

@implementation UIFactory

+ (instancetype)shareInstance
{
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        
        factory = [[self alloc] init];
    });
    
    return factory;
}

+ (UIButton *)createButtonWithTitle:(NSString *)title fontSize:(float)fontSize
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    button.titleLabel.font = [UIFont fontWithName:KFontName size:fontSize];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    return button;
}

+ (UIButton *)createNavBtnWith:(UIImage *)img frame:(CGRect)frame
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button setBackgroundImage:img forState:UIControlStateNormal];
    button.frame = frame;
    
    return button;
}

+ (UIImageView *)createUserPhoto
{
    UIImageView *userPhoto = [[UIImageView alloc] initWithFrame:CGRectZero];
    userPhoto.layer.borderColor = [UIColor redColor].CGColor;
    userPhoto.layer.cornerRadius = 22.0f;
    userPhoto.layer.borderWidth = 1.0f;
    userPhoto.layer.masksToBounds = YES;
    userPhoto.userInteractionEnabled = YES;
    
    return userPhoto;
}

+ (UILabel *)createLabel:(NSString *)text fontSize:(float)fontSize
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont fontWithName:KFontName size:fontSize];
    
    return label;
}
@end
