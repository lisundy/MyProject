//
//  BaseOptionVController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/5/4.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseOptionVController.h"
#import "ReplyVController.h"
#import "RepostVController.h"
#import "RequestUtils.h"
#import "UIUtils.h"

#define KOffset 40
#define KBtn_With 53
#define KBtn_height 53

@interface BaseOptionVController ()
{
    UIImageView         *optionView;
    UIImageView         *logoView;
    NSArray             *arrayBtnName;
    NSArray             *arrayBtnColor;
}
@end

@implementation BaseOptionVController

- (instancetype)initWithOID:(NSString *)OID
{
    self = [super init];
    if (self) {
        
        _OID = OID;
        [self initData];
    }
    return self;
}

- (void)initData
{
    arrayBtnName = [[NSArray alloc] initWithObjects:@"回复",@"转发",@"收藏",@"分享", nil];
    arrayBtnColor = [[NSArray alloc] initWithObjects:
                                                    [UIColor redColor],
                                                    [UIColor greenColor],
                                                    [UIColor blueColor],
                                                    [UIColor orangeColor],nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homeView.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.3];
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
    self.homeView.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"option_view_back"]];
    
    for (int i = 0; i<arrayBtnName.count; i++) {
        int colum = 2;
        int row = 2;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake( (self.homeView.contentView.frame.size.width - (colum -1)*KOffset - colum *KBtn_With)/2 + (i%colum)*(KBtn_With + KOffset), (self.homeView.contentView.frame.size.height - (row - 1) *KOffset - row*KBtn_height -21)/2 + (i/colum) *(KOffset + KBtn_height) - 21, KBtn_With, KBtn_height)];
        //
        [button addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[arrayBtnName objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[arrayBtnColor objectAtIndex:i]];
        button.layer.borderColor = [UIColor grayColor].CGColor;
        button.layer.cornerRadius = KBtn_height/2;
        button.tag = i;
        [self.homeView.contentView addSubview:button];
    }
    
    UIButton *dismissBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 23)/2, 0, 23, 21)];
    [dismissBtn setBackgroundImage:[UIImage imageNamed:@"del.png"] forState:UIControlStateNormal];
    [dismissBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 21, self.view.frame.size.width, 21)];
    [bottomView addSubview:dismissBtn];
    [self.homeView addSubview:bottomView];
    
}

#pragma mark reply回复
- (void)reply
{
    ReplyVController *replyVC = [[ReplyVController alloc] initWithOID:_OID];
    replyVC.baseOptionVC = self;
    
    [self presentViewController:replyVC animated:YES completion:nil];
}

#pragma mark repost
- (void)repost
{
    BaseViewController *baseVC = [[NSClassFromString(@"RepostVController") alloc] init];
    [self presentViewController:baseVC animated:YES completion:nil];
}

#pragma mark store
- (void)store
{
    //收藏接口  collect/add
    RequestUtils *request = [[RequestUtils alloc] init];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *token = [UIUtils getToken];
    
    [params setObject:token forKey:@"token"];
    [params setObject:_OID forKey:@"oid"];
    
    [request doPostHttpRequestWithParameters:params andURL:@"collect/add.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        NSString *msg  = [responseObject objectForKey:@"msg"];
        
        if ([@"code" isEqualToString:code]) {
            msg = @"收藏成功";
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [self.view addSubview:alert];
        [alert show];
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}

#pragma mark share
- (void)share
{
    
}

//
- (void)buttonClickMethod:(UIButton *)sender
{
    OptionBtnType type = sender.tag;
    
    switch (type) {
        case ReplyBtnType:
            [self reply];
            break;
        case RepostBtnType:
            [self repost];
            break;
        case StoreBtnType:
            [self store];
            break;
        case ShareBtnType:
            [self share];
            break;
        default:
            break;
    }
}


#pragma mark dismiss VC
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
