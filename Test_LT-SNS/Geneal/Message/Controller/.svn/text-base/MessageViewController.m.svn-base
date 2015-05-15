//
//  MessageViewController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableView.h"
#import "MessageCellModel.h"
#import "RequestUtils.h"
#import "UIUtils.h"

@interface MessageViewController ()
{
    NSMutableArray *data;
    MessageTableView *myTable;
}

@property (retain, nonatomic) MessageCellModel *messageCellModel;
@end

@implementation MessageViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self loadData];
    }
    return self;
}

#pragma mark 加载数据
- (void)loadData
{
    NSDictionary *dic = @{@"myLeshiIcon":@"@我的乐事",
                          @"myCommentIcon":@"@我的评论",
                          @"acceptCommentIcon":@"我收到的评论",
                          @"messagesIcon":@"消息验证",
                        };
    
    NSArray *imagArray = [dic allKeys];
    NSArray *nameArray = [dic allValues];
    
    data = [[NSMutableArray alloc] init];
    
    for (int i= 0; i<imagArray.count; i++) {
        
        _messageCellModel = [[MessageCellModel alloc] init];
        _messageCellModel.messageTypeImg = [imagArray objectAtIndex:i];
        _messageCellModel.messageTypeName = [nameArray objectAtIndex:i];
        
        [data addObject:_messageCellModel];
    }
    
    RequestUtils *request = [[RequestUtils alloc] init];
    NSMutableDictionary *params = [UIUtils getParam];
    
    [request doGetHttpRequestWithParameters:params andURL:@"exten/news_count.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        [self loadDataFinished:responseObject];
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
    
}

- (void)loadDataFinished:(id)result
{
    myTable.data = data;
    
    NSArray *arrayNewsCount = [[NSArray alloc] initWithObjects:
                      [result objectForKey:@"atcomment_number"],
                      [result objectForKey:@"tocomment_number"],
                      [result objectForKey:@"verify_number"],
                      [result objectForKey:@"athappymsg_number"], nil];
    
    myTable.newsCount = arrayNewsCount;
    
    [myTable reloadData];

}

#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    myTable = [[MessageTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.homeView.contentView addSubview:myTable];
    self.homeView.navigationView.navigationTitle = @"消息";
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
