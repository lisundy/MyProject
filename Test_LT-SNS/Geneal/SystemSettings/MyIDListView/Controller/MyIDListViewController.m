//
//  MyIDListViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "MyIDListViewController.h"
#import "MyIDListView.h"
#import "MyIDListModel.h"

#import "RequestUtils.h"
#import "UIUtils.h"

@interface MyIDListViewController ()

@property(nonatomic,strong)MyIDListView *listView;

@end

@implementation MyIDListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeView.navigationView.navigationTitle = @"我的身份";
    _listView = [[MyIDListView alloc] initWithFrame:self.homeView.contentView.bounds style:UITableViewStylePlain];
    
    [self.homeView.contentView addSubview:_listView];
    
    [self doRequest];
}

-(void)doRequest{
    NSString *token = [UIUtils getToken];
    
    RequestUtils *request = [[RequestUtils alloc] init];
    [request doGetHttpRequestWithParameters:@{@"token":token}
                                     andURL:@"users/all.json"
                                 andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                                     [self responseSomething:responseObject];
                                     
                                 } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                     
                                 }];
}

-(void)responseSomething:(id)responseObject{
    NSLog(@"%@",responseObject);
    NSArray *objs = [responseObject objectForKey:@"obj"];
    NSMutableArray *models = [[NSMutableArray alloc] init];
    [objs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *dict = (NSDictionary *)obj;
        MyIDListModel *model = [[MyIDListModel alloc] initWithDictionary:dict andRow:[NSNumber numberWithInteger:idx]];
        [models addObject:model];
    }];
    _listView.myIDListModelsArray = models;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
