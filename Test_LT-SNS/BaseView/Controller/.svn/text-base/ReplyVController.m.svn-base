//
//  ReplyVController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/5/4.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "ReplyVController.h"
#import "RequestUtils.h"
#import "UIUtils.h"
#import "BaseOptionVController.h"

#define KSENDCOMMENTNOFICATION @"KSendCommentNofification"

//回复页面
@interface ReplyVController () <UITextViewDelegate>
{
    UITextView          *textView;
    UILabel             *placeholderLabel;
    UIScrollView        *scrollView;
    UILabel             *bottomLine;
    UILabel             *strCountHint;//字数提示
}

@end

@implementation ReplyVController

- (id)initWithOID:(NSString *)OID
{
    if (self = [super init]) {
        
        _oid = OID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    [rightButton setTitle:@"发送" forState:UIControlStateNormal];
    rightButton.tag = 102;
    
    
    //撰写回复的界面部分
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.contentView.width, 150)];
    placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 20)];
    textView.font = [UIFont fontWithName:@"Helvetica" size:14];
    placeholderLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    placeholderLabel.text = @"随便说点什么...";
    placeholderLabel.backgroundColor = [UIColor clearColor];
    placeholderLabel.textColor = [UIColor lightTextColor];
    placeholderLabel.enabled = NO;//lable必须设置为不可用
    textView.layer.borderWidth = 0.3;
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.masksToBounds = YES;
    textView.delegate = self;
    [textView addSubview:placeholderLabel];
    
    
    strCountHint = [[UILabel alloc] initWithFrame:CGRectMake(self.homeView.contentView.width - 70, textView.bottom + 1, 60, 30)];
    strCountHint.font = [UIFont fontWithName:@"Helvetica" size:10];
    strCountHint.textAlignment = NSTextAlignmentRight;
    strCountHint.textColor = [UIColor orangeColor];
    strCountHint.text = @"300 字";
    strCountHint.hidden = YES;
    [self.homeView.contentView addSubview:strCountHint];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.contentView.width, 150)];
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    [scrollView addSubview:textView];
    
    [self.homeView.contentView addSubview:scrollView];
    [self.homeView.navigationView addSubview:leftButton];
    [self.homeView.navigationView addSubview:rightButton];
    self.homeView.navigationView.navigationTitle = @"发送评论";
    
    
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
            [self sendComment];
            break;
        default:
            break;
    }
}

#pragma mark 发表评论
- (void)sendComment
{
    NSString *contentText = textView.text;
    if ([@"" isEqualToString:contentText]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"请输入内容" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [self.view addSubview:alert];
        [alert show];
        return;
    }
    
    RequestUtils *request = [[RequestUtils alloc] init];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *token = [UIUtils getToken];
    
    [params setObject:token forKey:@"token"];
    [params setObject:_oid forKey:@"oid"];
    [params setObject:contentText forKey:@"text"];
    [params setObject:@"0" forKey:@"pcid"];
    
    //comment/create
    [request doPostHttpRequestWithParameters:params andURL:@"comment/create.json?" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        NSString *msg  = [responseObject objectForKey:@"msg"];
        
        if ([@"100" isEqualToString:code]) {
            //发送通知
            [[NSNotificationCenter defaultCenter]
                                    postNotificationName:KSENDCOMMENTNOFICATION
                                    object:nil userInfo:nil];
            
            [self dismissViewControllerAnimated:YES completion:nil];
            [_baseOptionVC dismissViewControllerAnimated:YES completion:nil];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [self.view addSubview:alert];
            [alert show];
        }
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    placeholderLabel.hidden = YES;
    bottomLine.hidden = NO;
    strCountHint.hidden = NO;
}

- (void)textViewDidChange:(UITextView *)txtView
{
    NSInteger count = txtView.selectedRange.location;
    
    NSString *str = [NSString stringWithFormat:@"%li 字",300-count];
    strCountHint.text = str;
}

- (void)textViewDidEndEditing:(UITextView *)txtView
{
    NSString *str = txtView.text;
    
    if ([str isEqualToString:@""]) {
        
        placeholderLabel.hidden = NO;
        strCountHint.hidden = YES;
    }
    bottomLine.hidden = YES;
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

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
