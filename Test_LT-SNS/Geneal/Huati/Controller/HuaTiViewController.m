//
//  HuaTiViewController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HuaTiViewController.h"
#import "HuaTiViewModel.h"
#import "HuatiDtailTopView.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
#import "BaseTableView.h"
#import "CommentModel.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"
#import "BaseOptionVController.h"
#import "RequestUtils.h"
#import "UIUtils.h"
#import "CommentTableView.h"

#define KOffset 3
#define KTextOffset 10
#define KImageH 44


@class UserModel;
@interface HuaTiViewController ()
{
    NSString        *index;
    NSString        *totalCount;//评论总数
    CommentModel    *commentModel;
    float           tableviewTotalHeigh;
    BOOL            isMore;//下拉刷新时用到
    NSString        *commentIndex;
}

@end

@implementation HuaTiViewController
@synthesize HuatiID;

- (instancetype)initWithID:(NSString *)ID
{

    if (self = [super init]) {
        
        HuatiID = ID;
        
        [self loadHuatiInfo];
    }
    
    return self;
}

- (void)loadHuatiInfo
{
    RequestUtils *request = [[RequestUtils alloc] init];
    NSString *token = [UIUtils getToken];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   token,@"token",
                                   HuatiID,@"tid", nil];
    [self showProgressHudInView:self.view animated:YES];
    
    [request doGetHttpRequestWithParameters:params andURL:@"ht/show.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        if ([@"100" isEqualToString:code]) {
            
            [self loadHuatiInfoFinished:responseObject];
        }
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)loadHuatiInfoFinished:(id)result
{
    _huatiModel = [[HuaTiViewModel alloc] initWithDataDic:result];
    
    [self myLayoutSubviews];
    
    commentIndex = @"1";
    [self loadCommentData:commentIndex];
    
}

#pragma mark 加载评论网络数据
- (void)loadCommentData:(NSString *)index
{
    RequestUtils *request = [[RequestUtils alloc] init];
    
    NSMutableDictionary *params = [UIUtils getParam];
    [params setObject:commentIndex forKey:@"index"];
    [params setObject:HuatiID forKey:@"oid"];
    [params setObject:COMMENT_SIZE forKey:@"size"];
    
    [request doGetHttpRequestWithParameters:params andURL:@"comment/show.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"%@",responseObject);
        NSString *code = [responseObject objectForKey:@"code"];
        totalCount = [responseObject objectForKey:@"total_count"];
        
        if ([@"100" isEqualToString:code]) {
            
            [self hideProgressHudInView:self.view animated:YES];
            [_commentTableView stopRefreshing];

            [self loadCommentDataFinished:responseObject];
        }
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        [_commentTableView stopRefreshing];
        
    }];

}


- (void)loadCommentDataFinished:(id)result
{
    NSMutableArray *dataArray = [result objectForKey:@"obj"];
    
    NSMutableArray * cData = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    
    for (int i = 0; i < dataArray.count; i ++) {
        
        NSDictionary *dic = [dataArray objectAtIndex:i];
        
        commentModel = [[CommentModel alloc] initWithDataDic:dic];
        
        [cData addObject:commentModel];
    }
    if (isMore) {
        //下拉刷新
        [_commentData addObjectsFromArray:cData];
    }else{
        _commentData = cData.count==0?_commentData : cData;
    }
    
    [self setCommentList];
    _commentTableView.allCommentData = _commentData;
    [_commentTableView reloadData];

    
}

#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    totalCount = @"0";
    
    UIButton *leftButton = [UIFactory createNavBtnWith:
                            [UIImage imageNamed:@"back_btn"] frame:CGRectMake(10, 20, 30, 44)];
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.tag = 101;
    
    UIButton *rightButton = [UIFactory createNavBtnWith:
                             [UIImage imageNamed:@"addPhoto"] frame:CGRectMake(self.homeView.navigationView.width - 30, 20, 30, 44)];
    [rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.layer.borderColor = [UIColor orangeColor].CGColor;
    rightButton.layer.borderWidth = 2.0f;
    rightButton.tag = 102;
    
    self.homeView.navigationView.leftButton = leftButton;
    self.homeView.navigationView.rightButton = rightButton;
    self.homeView.navigationView.navigationTitle = @"话题详情";
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
    
    _huatiScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    
    //文字文本
    _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _textLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    _textLabel.numberOfLines = 0;//不限制行数
    [_huatiScrollView addSubview:_textLabel];
    
    //评论总数
    _totalCommentLabel = [UIFactory createLabel:nil fontSize:14];
    [_huatiScrollView addSubview:_totalCommentLabel];
    
    //评论表
    _commentTableView = [[CommentTableView alloc] initWithFrame:CGRectZero];
    _commentTableView.tableFooterView.hidden = YES;
    _commentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    __block typeof(self) weakSelf = self;
    [_commentTableView addRefreshWithRefreshType:RefreshTypeLegendFooter andRefreshingBlock:^{
        [weakSelf downRefresh];
    }];

    [_huatiScrollView addSubview:_commentTableView];
    
    [self.homeView.contentView addSubview:_huatiScrollView];
    
}

//注册通知
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshCommentTable:) name:@"KSendCommentNofification" object:nil];
}

- (void)refreshCommentTable:(NSNotification *)notification
{
    [self loadCommentData:@"1"];
}

#pragma mark 下拉刷新
- (void)downRefresh
{
    isMore = YES;
    commentIndex = [NSString stringWithFormat:@"%i",[commentIndex intValue]+1];
    
    [self loadCommentData:commentIndex];
}

#pragma mark 组件布局和数据填充
- (void)myLayoutSubviews
{
    if (_huatiModel != nil) {
        
        _imageArray = _huatiModel.img_urls;
        //scrollview
        _huatiScrollView.frame = CGRectMake(0, 0, self.view.width, self.homeView.contentView.height);
        _huatiScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        
        //个人简介topview
        _huatiDtailTopView = [[HuatiDtailTopView alloc] initWithModel:_huatiModel];
        [_huatiScrollView addSubview:_huatiDtailTopView];
        
        //文本
        CGSize textSize = [self getTextSize:_huatiModel.long_text withFont:[UIFont fontWithName:@"Helvetica" size:13]];
        CGRect textRect = CGRectMake(10, KTopViewH + KOffset + 10, self.view.width-20, textSize.height);
        
        _textLabel.frame = textRect;
        _textLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
        _textLabel.backgroundColor = [UIColor lightTextColor];
        _textLabel.text = _huatiModel.long_text;
        [_textLabel sizeToFit];

        //图片
        if (_huatiModel.img_urls.count != 0) {
            for (int i = 0; i<_huatiModel.img_urls.count; i++) {
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 + i * (KImageH+1), _textLabel.bottom + KOffset, KImageH, KImageH)];
                imageView.tag = i;
                imageView.userInteractionEnabled = YES;
                
                NSURL *imagUrl = [NSURL URLWithString:[_huatiModel.img_urls objectAtIndex:i]];
                
                [imageView sd_setImageWithURL:imagUrl placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
                
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewImage:)];
                [imageView addGestureRecognizer:tapGesture];
                
                [_huatiScrollView addSubview:imageView];
            }
        }
        
    }
}

- (void)setCommentList
{
    float height = _huatiModel.img_urls.count != 0?_textLabel.bottom + 2*KOffset + KImageH:_textLabel.bottom + KOffset;

    //评论总数
    _totalCommentLabel.frame = CGRectMake(10, height + KOffset, self.homeView.contentView.width - 20, 30);
    
    _totalCommentLabel.text = [NSString stringWithFormat:@"%@条评论",totalCount];
    
    //评论列表
    _commentTableView.frame = CGRectMake(10, _totalCommentLabel.bottom + KOffset, self.homeView.contentView.width - 20, [CommentTableView getTableviewHeight:_commentData]);
    
    _huatiScrollView.contentSize = CGSizeMake(self.view.width, _commentTableView.bottom);//高度需要根据内容来设定
}

#pragma mark 计算文本大小
 - (CGSize )getTextSize:(NSString *)str withFont:(UIFont *)dateFont
{
    CGSize maximumSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-70, MAXFLOAT);
    
    CGSize dateStringSize = [str sizeWithFont:dateFont
                            constrainedToSize:maximumSize
                                lineBreakMode:NSLineBreakByWordWrapping];
    UILabel *label = [[UILabel alloc] init];
    label.text = str;
    CGRect myFrame = CGRectMake(0, 0, dateStringSize.width, dateStringSize.height);
    label.numberOfLines = 0;
    label.frame = myFrame;
    [label sizeToFit];
    
    return label.size;
}



#pragma mark 点击图片放大
- (void)viewImage:(UITapGestureRecognizer *)gesture
{
    NSInteger index = gesture.view.tag;
    NSMutableArray *_photoArrays = [[NSMutableArray alloc] init];
    
    for (int i = 0; i< _imageArray.count; i++) {
        // 替换为中等尺寸图片
        NSString *url = [_imageArray objectAtIndex:i];
        
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.url = [NSURL URLWithString:url]; // 图片路径
        [_photoArrays addObject:photo];
    }
    
    MJPhotoBrowser *photoBrowser = [[MJPhotoBrowser alloc] init];
    photoBrowser.photos = _photoArrays;
    photoBrowser.currentPhotoIndex = index;
    
    [photoBrowser show];
    
}

#pragma mark BaseOptionView delegate代理方法实现
- (void)optionwith:(NSInteger)btnClickType
{
    
}

#pragma mark 操作
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

#pragma mark 弹出操作界面 - 回复，转发，收藏，分享等
- (void)popOptionVC
{
    BaseOptionVController *baseOptionVC = [[BaseOptionVController alloc] initWithOID:HuatiID];
    [self presentViewController:baseOptionVC animated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
