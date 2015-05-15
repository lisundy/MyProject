//
//  UIFactory.h
//  Test_LT-SNS
//
//  Created by pactera on 15/5/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIFactory : NSObject

+ (instancetype)shareInstance;

+ (UIButton *)createButtonWithTitle:(NSString *)title fontSize:(float)fontSize;

+ (UIButton *)createNavBtnWith:(UIImage *)img frame:(CGRect)frame;

//创建用户头像
+ (UIImageView *)createUserPhoto;

+ (UILabel *)createLabel:(NSString *)text fontSize:(float)fontSize;
@end
