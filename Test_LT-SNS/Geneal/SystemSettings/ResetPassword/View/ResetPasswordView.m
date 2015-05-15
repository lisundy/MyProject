//
//  ResetPasswordView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "ResetPasswordView.h"


@interface ResetPasswordView()

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITextField *oldPassword;
@property(nonatomic,strong)UITextField *theNewPassword;
@property(nonatomic,strong)UITextField *confirmPassword;
@property(nonatomic,strong)UIButton *confirmButton;


@end

@implementation ResetPasswordView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.contentSize = CGSizeMake(frame.size.width, frame.size.height+1);
        [self addSubview:_scrollView];
        
        CGFloat border = 5;
        CGFloat textFieldHeight = 44;
        CGFloat textFieldWidth = frame.size.width-2*border;
        CGFloat textFieldX = frame.origin.x+border;
        
        _oldPassword = [[UITextField alloc] initWithFrame:CGRectMake(textFieldX, border, textFieldWidth, textFieldHeight)];
        _oldPassword.placeholder = @"请输入旧密码";
        _oldPassword.borderStyle = UITextBorderStyleRoundedRect;
        
        _theNewPassword = [[UITextField alloc] initWithFrame:CGRectMake(textFieldX, CGRectGetMaxY(_oldPassword.frame)+border, textFieldWidth, textFieldHeight)];
        _theNewPassword.placeholder = @"请输入新密码";
        _theNewPassword.borderStyle = UITextBorderStyleRoundedRect;
        
        _confirmPassword = [[UITextField alloc] initWithFrame:CGRectMake(textFieldX, CGRectGetMaxY(_theNewPassword.frame)+border, textFieldWidth, textFieldHeight)];
        _confirmPassword.placeholder = @"请输入确认密码";
        _confirmPassword.borderStyle = UITextBorderStyleRoundedRect;
        
        [_scrollView addSubview:_oldPassword];
        [_scrollView addSubview:_theNewPassword];
        [_scrollView addSubview:_confirmPassword];
        
        
        _confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(textFieldX, CGRectGetMaxY(_confirmPassword.frame)+border, textFieldWidth, textFieldHeight)];
        [_confirmButton setTitle:@"确认修改" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_confirmButton setBackgroundColor:[UIColor blueColor]];
        _confirmButton.layer.masksToBounds = YES;
        _confirmButton.layer.cornerRadius = 10.0f;
        [_scrollView addSubview:_confirmButton];
        
    }
    return self;
}


@end
