//
//  LeShiDetailViewController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "LeShiDetailViewController.h"
#import "LeShiViewModel.h"
#import "UIImageView+WebCache.h"
#import "LeshiTopView.h"
#import "IndexViewCell.h"
#import "CommentModel.h"
#import "BaseOptionVController.h"
#import "RequestUtils.h"
#import "CommentTableView.h"
#import "UIUtils.h"

#define KOffset 3

@interface LeShiDetailViewController ()
{
    UILabel             *lineLabel;
    NSMutableArray      *commentData;
    LeShiViewModel      *leshiModel;
    NSString            *totalCount;
    CommentModel        *commentModel;
    BOOL                isMore;//下拉刷新判断
    NSString            *commentIndex;
}
@end

@implementation LeShiDetailViewController
@synthesize leshiID;

- (instancetype)initWithID:(NSString *)ID
{
    self = [super init];
    
    if (self) {
        
        leshiID    = ID;
        [self loadLeshiInfo];
    }
    
    return self;
}

- (void)loadLeshiInfo
{
    RequestUtils *request = [[RequestUtils alloc] init];
    
    NSString *token = [UIUtils getToken];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                         token,@"token",
                         leshiID,@"hid", nil];
    
    [self showProgressHudInView:self.view animated:YES];
    
    [request doGetHttpRequestWithParameters:params andURL:@"ls/show.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        
        if ([@"100" isEqualToString:code]) {
            
            [self loadLeshiInfoFinished:responseObject];
        }
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
        NSLog(@"%@",error);
        
    }];
    [self hideProgressHudInView:self.view animated:YES];
}

- (void)loadLeshiInfoFinished:(id)result
{
    leshiModel = [[LeShiViewModel alloc] initWithDataDic:result];
    //加载评论
    commentIndex = @"1";
    [self loadCommentData:commentIndex];
    
    [self myLayoutSubviews];

}

- (void)loadCommentData:(NSString *)index
{
    RequestUtils *request = [[RequestUtils alloc] init];
    
    NSMutableDictionary *params = [UIUtils getParam];
    [params setObject:index forKey:@"index"];
    [params setObject:leshiID forKey:@"oid"];
    [params setObject:COMMENT_SIZE forKey:@"size"];
    
    [request doGetHttpRequestWithParameters:params andURL:@"comment/show.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //        NSLog(@"%@",responseObject);
        NSString *code = [responseObject objectForKey:@"code"];
        totalCount = [responseObject objectForKey:@"total_count"];
        
        if ([@"100" isEqualToString:code]) {
            
            [self hideProgressHudInView:self.view animated:YES];
            [_commentList stopRefreshing];

            [self loadCommentDataFinished:responseObject];
        }
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
}

- (void)loadCommentDataFinished:(id)result
{
    NSMutableArray *dataArray = [result objectForKey:@"obj"];
    
    NSMutableArray *cData = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    
    for (int i = 0; i < dataArray.count; i ++) {
        
        NSDictionary *dic = [dataArray objectAtIndex:i];
        
        commentModel = [[CommentModel alloc] initWithDataDic:dic];
        
        [cData addObject:commentModel];
    }
    if (isMore) {
        //下拉刷新
        [commentData addObjectsFromArray:cData];
    }else{
        
        commentData = cData.count==0?commentData:cData;
    }
        
    _commentList.allCommentData = commentData;
    [_commentList reloadData];
    [self setCommentList];
}

#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize screenSize = self.homeView.frame.size;
    
    //10, 20, 30, 44
    UIButton *leftButton = [UIFactory createNavBtnWith:
                            [UIImage imageNamed:@"back_btn"] frame:CGRectMake(10, 20, 30, 44)];
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.tag = 101;
    
    //self.homeView.navigationView.width - 30, 20
    UIButton *rightButton = [UIFactory createNavBtnWith:
                             [UIImage imageNamed:@"addPhoto"] frame:CGRectMake(self.homeView.navigationView.width - 30, 20, 0, 0)];
    [rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.layer.borderColor = [UIColor orangeColor].CGColor;
    rightButton.layer.borderWidth = 2.0f;
    rightButton.tag = 102;
    
    self.homeView.navigationView.leftButton = leftButton;
    self.homeView.navigationView.rightButton = rightButton;
    self.homeView.navigationView.navigationTitle = @"乐事正文";
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
    
    //内容显示区域
    _leshiScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height - 44)];
    _leshiScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    
    [self.homeView.contentView addSubview:_leshiScrollView];
    
    //乐事内容
    static NSString *cellIdetifier = @"cellIdetifier";
    _contentCell = [[IndexViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdetifier];
    [_leshiScrollView addSubview:_contentCell];
    
    _commentTotalLabel = [UIFactory createLabel:nil fontSize:14];
    [_leshiScrollView addSubview:_commentTotalLabel];
    
    //评论列表
    _commentList = [[CommentTableView alloc] init];
    _commentList.separatorStyle = UITableViewCellSeparatorStyleNone;
    _commentList.tableFooterView.hidden = YES;
    
    __block typeof(self) weakSelf = self;
    [_commentList addRefreshWithRefreshType:RefreshTypeLegendFooter andRefreshingBlock:^{
        [weakSelf upRefresh];
    }];
    [_leshiScrollView addSubview:_commentList];
}

- (void)myLayoutSubviews
{
    if (leshiModel != nil) {
        
        _leshiTopView = [[LeshiTopView alloc] initWithModel:leshiModel];
        _leshiTopView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 45);
        
        [_leshiScrollView addSubview:_leshiTopView];
        
        _contentCell.userInteractionEnabled = NO;
        _contentCell.type = kLeShiViewInfo;
        _contentCell.leshiViewModel = leshiModel;
        _contentCell.drawLinelabel.hidden = YES;
        _contentCell.headImageView.hidden = YES;
        _contentCell.nickNameBtn.hidden = YES;
        _contentCell.typeImageView.hidden = YES;
        _contentCell.commenNumlabel.hidden = YES;
        _contentCell.fromLabel.hidden = YES;
        _contentCell.createDateLabel.hidden = YES;
        
        _contentCell.frame = CGRectMake(0, _leshiTopView.bottom-15, [UIScreen mainScreen].bounds.size.width - 100, [IndexViewCell getLeshiCellHeight:_contentCell.leshiViewModel]);
        
        [_contentCell setNeedsLayout];
        
        _commentTotalLabel.frame = CGRectMake(10, _contentCell.bottom - 15, 250, 22);
        _commentTotalLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
        _commentTotalLabel.textAlignment = NSTextAlignmentLeft;
        _commentTotalLabel.text = [NSString stringWithFormat:@"总共:%@条评论",
                                   leshiModel.feedback_count==nil?@"0":leshiModel.feedback_count];
    }
}

- (void)setCommentList
{
    _commentList.frame = CGRectMake(10, _commentTotalLabel.bottom + KOffset, [UIScreen mainScreen].bounds.size.width ,[CommentTableView getTableviewHeight:commentData]);
    _leshiScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, _commentList.bottom);
}

#pragma mark 上拉刷新
- (void)upRefresh
{
    isMore = YES;
    commentIndex = [NSString stringWithFormat:@"%i",[commentIndex intValue]+1];
    [self loadCommentData:commentIndex];
}

#pragma mark 返回操作
- (void)buttonClick:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    
    switch (tag) {
        case 101:
            
            [self back];
            
            break;
            
        case 102:
            
            [self popOptionVC];
            
            break;
        default:
            break;
    }
}

#pragma mark back
- (void)back
{
    [self popVCWithAnimation];
}

#pragma mark 弹出操作界面
- (void)popOptionVC
{
    BaseOptionVController *baseOptionVC = [[BaseOptionVController alloc] initWithOID:leshiID];
    
    [self presentViewController:baseOptionVC animated:YES completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
