//
//  RepostVController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/5/5.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "RepostVController.h"
#import "IQKeyboardManager.h"
#import "RequestUtils.h"
#import "UIUtils.h"

@interface RepostVController () <UITextViewDelegate>
{
    UITextView          *textView;
    UILabel             *placeholderLabel;
    UIScrollView        *scrollView;
    UIView              *bottomView;//
    UIButton            *atBtn;//@按钮
}

@end

@implementation RepostVController

- (instancetype)initWithID:(NSString *)ID
{
    if (self = [super init]) {
        
        _ID = ID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeView.navigationView.navigationTitle = @"转发信息";
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.homeView.contentView addGestureRecognizer:tap];
    
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 60, 44)];
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    [leftButton setTitle:@"取消" forState:UIControlStateNormal];
    leftButton.tag = 101;
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(self.homeView.navigationView.width - 60, 20, 60, 44)];
    [rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    [rightButton setTitle:@"转发" forState:UIControlStateNormal];
    rightButton.tag = 102;
    
    [self.homeView.navigationView addSubview:leftButton];
    [self.homeView.navigationView addSubview:rightButton];

    //撰写转发内容的区域
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.contentView.width, 100)];
    placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 20)];
    textView.font = [UIFont fontWithName:@"Helvetica" size:14];
    placeholderLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    placeholderLabel.text = @"说点什么...";
    placeholderLabel.backgroundColor = [UIColor clearColor];
    placeholderLabel.textColor = [UIColor lightTextColor];
    placeholderLabel.enabled = NO;//lable必须设置为不可用
    textView.layer.borderWidth = 0.3;
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.masksToBounds = YES;
    textView.delegate = self;
    [textView addSubview:placeholderLabel];
    [self.homeView.contentView addSubview:textView];
    
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.homeView.contentView.height - 30, self.homeView.contentView.width, 30)];
    bottomView.layer.borderWidth = 0.3;
    bottomView.layer.borderColor = [UIColor grayColor].CGColor;
    bottomView.layer.masksToBounds = YES;
    [self.homeView.contentView addSubview:bottomView];
    
    atBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [atBtn setTitle:@"@" forState:UIControlStateNormal];
    [atBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [atBtn addTarget:self action:@selector(atPerson) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:atBtn];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 0, 200, 30)];
    [bottomView addSubview:textField];
}

#pragma mark @某些人
- (void)atPerson
{
    NSLog(@"@");
}

#pragma mark 返回操作
- (void)buttonClick:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    
    switch (tag) {
        case 101:
            [self quit];
            break;
        case 102:
            [self repost];
            break;
        default:
            break;
    }
}

/*
 转发话题	/ls/create	des
 popedom
 默认为公开
 默认为false 即公开
 hid
 */

#pragma mark 转发
- (void)repost
{
    
}

#pragma mark UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
//    bottomView.frame = CGRectMake(0, self.homeView.contentView.height - 216 -115, self.homeView.contentView.width, 30);
//    [UIView commitAnimations];
    
    
}


- (void)textViewDidEndEditing:(UITextView *)textView
{
    bottomView.frame = CGRectMake(0, self.homeView.contentView.height - 30, self.homeView.contentView.width, 30);
    
    [UIView commitAnimations];
}

#pragma mark tapAction
- (void)tapAction:(UIGestureRecognizer *)gesture
{
    [self closeKeysBoard];
}

#pragma mark back
- (void)quit
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//关闭键盘
- (void)closeKeysBoard
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}


@end
