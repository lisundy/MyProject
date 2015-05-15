//
//  RelationViewController.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "RelationViewController.h"
#import "HeadView.h"
#import "TopView.h"
#import "RelatedPersonCell.h"
#import "DialogView.h"
#import "RequestUtils.h"
#import "UIUtils.h"
#import "RelationModel.h"
#import "UserModel.h"
#import "BaseTableView.h"
#import "PersonalInfoViewController.h"

#define KSearchHeight 30
#define KHeadViewH 44
#define KDIALOGHEIGHT 100
#define KDIALOGWIDTH  200

@interface RelationViewController () <HeadViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,RelationVCDelegate,OpenDialogViewDelegate>
{
    UITableView             *myTableview;
    NSMutableDictionary     *headViewStatus;//标题栏状态
    UISearchBar             *searchBar;//搜索
    TopView                 *personView;//用户简介
    DialogView              *dialogView;//提示操作框
    
    CGSize                  contentSize;
    
    NSArray                  *groupName;
    NSMutableArray           *fansArray;//粉丝
    NSMutableArray           *myCareArray;//我的关注
    NSMutableArray           *bothCareArray;//双向关注
    
    RequestUtils             *request;
    NSMutableDictionary      *params;
    BOOL                      showHUD;
    
    NSDictionary              *dicData;//表格数据

}@end

@implementation RelationViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        groupName = [[NSArray alloc] initWithObjects:
                     @"我的粉丝",
                     @"我的关注",
                     @"我的朋友", nil];
        headViewStatus = [[NSMutableDictionary alloc] initWithCapacity:groupName.count];
        [self loadData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化组件
    [self initComponent];
}

/*
 获取我的粉丝列表	/friends/fans
 获取我的关注列表	/friends/look
 获取我的双向关注列表	/friends/friend
 */

#pragma mark 初始化相关数据
- (void)loadData
{
    for (int i = 0; i<groupName.count; i++) {
        
        [headViewStatus setObject:@(0) forKey:@(i)];
    }
    request = [[RequestUtils alloc] init];
    params  = [UIUtils getParam];
    
    if (showHUD) {
        [self showProgressHudInView:self.view animated:YES];
    }
    
    [self loadFansData];
    
    [self loadMyCareData];
    
    [self loadBothCareData];
    
    [self loadDataFinished:nil];
}

- (void)loadDataFinished:(id)result
{
    [myTableview reloadData];
}

//粉丝
- (void)loadFansData
{
    [request doGetHttpRequestWithParameters:params andURL:@"friends/fans.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        if ([@"100" isEqualToString:code]) {
           
            [self hideProgressHudInView:self.view animated:YES];
            [self loadFansData:responseObject];
        }
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)loadFansData:(id)result
{
    NSArray *dataArray = [result objectForKey:@"obj"];
    NSMutableArray *tData = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    
    for (int i = 0; i<dataArray.count; i++) {
        
        NSDictionary *dic = [[dataArray objectAtIndex:i] objectForKey:@"user"];
        RelationModel *relationModel = [[RelationModel alloc] initWithDataDic:dic];
        [tData addObject:relationModel];
    }
    fansArray = tData;
}

//我的关注
- (void)loadMyCareData
{
    [request doGetHttpRequestWithParameters:params andURL:@"friends/look.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        
        if ([@"100" isEqualToString:code]) {
            
            [self hideProgressHudInView:self.view animated:YES];
            [self loadMyCareData:responseObject];
        }
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)loadMyCareData:(id)result
{
    NSArray *dataArray = [result objectForKey:@"obj"];
    NSMutableArray *tData = [[NSMutableArray alloc] initWithCapacity:dataArray.count];

    for (int i = 0; i<dataArray.count; i++) {
        
        NSDictionary *dic = [[dataArray objectAtIndex:i] objectForKey:@"user"];
        RelationModel *relationModel = [[RelationModel alloc] initWithDataDic:dic];
        [tData addObject:relationModel];
    }
    myCareArray = tData;
}

//我的朋友
- (void)loadBothCareData
{
    [request doGetHttpRequestWithParameters:params andURL:@"friends/friend.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        
        if ([@"100" isEqualToString:code]) {
            
            [self hideProgressHudInView:self.view animated:YES];
            [self loadBothCareData:responseObject];
        }
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)loadBothCareData:(id)result
{
    NSArray *dataArray = [result objectForKey:@"obj"];
    NSMutableArray *tData = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    for (int i = 0; i<dataArray.count; i++) {
        
        NSDictionary *dic = [[dataArray objectAtIndex:i] objectForKey:@"user"];
        RelationModel *relationModel = [[RelationModel alloc] initWithDataDic:dic];
        [tData addObject:relationModel];
    }
    bothCareArray = tData;
    dicData = [NSDictionary dictionaryWithObjectsAndKeys:fansArray,@(0),myCareArray,@(1),bothCareArray,@(2), nil];
    [self loadDataFinished:nil];
}

#pragma mark 初始化组件
- (void)initComponent
{
    contentSize = self.homeView.contentView.size;
    
    self.homeView.navigationView.navigationTitle = @"关系";
    self.homeView.navigationView.backgroundColor = [UIColor orangeColor];
    
    personView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.contentView.bounds.size.width, 64)];
    personView.tag = 101;
    [self.homeView.contentView addSubview:personView];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, personView.bottom, self.homeView.contentView.bounds.size.width, KSearchHeight)];
    searchBar.placeholder = @"搜索";
    searchBar.barTintColor = [UIColor whiteColor];
    searchBar.layer.borderColor = [UIColor grayColor].CGColor;
    searchBar.layer.borderWidth = 0.8;
    searchBar.layer.cornerRadius = 8;
    searchBar.layer.masksToBounds = YES;
    [self.homeView.contentView addSubview:searchBar];
    
    myTableview = [[BaseTableView alloc] initWithFrame:
                   CGRectMake(5, searchBar.bottom, self.homeView.contentView.width - 10, self.homeView.contentView.height-searchBar.height) style:UITableViewStylePlain];
    myTableview.tag = 102;
    myTableview.rowHeight = 54;
    myTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableview.dataSource = self;
    myTableview.delegate = self;
    
    //添加手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoard:)];
    [personView addGestureRecognizer:tapGesture];
    [self.homeView.contentView addSubview:myTableview];
}

#pragma mark Tableview delegate&datasource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return KHeadViewH;
}
//设置分组
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerViewIdenfier = @"headerViewIdenfier";
    HeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdenfier];
    if (headView == nil) {
        headView = [[HeadView alloc] initWithReuseIdentifier:headerViewIdenfier];
    }
    headView.groupName = [groupName objectAtIndex:section];
    headView.delegate = self;
    headView.section = section;
    return headView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dicData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BOOL isOpen = [[headViewStatus objectForKey:@(section)] boolValue];
    NSArray *array = [dicData objectForKey:@(section)];
    return isOpen ? array.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdetifier = @"cellIdetifier";
    RelatedPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdetifier];
    if (cell == nil) {
        
        cell = [[RelatedPersonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdetifier];
    }
    cell.relationModel = [[dicData objectForKey:@(indexPath.section)] objectAtIndex:indexPath.row];
    cell.delegate = self;
    cell.tag = indexPath.section;
    cell.rowNum = indexPath.row;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RelationModel *relationModel = [[dicData objectForKey:@(indexPath.section)] objectAtIndex:indexPath.row];
    PersonalInfoViewController *personVC = [[PersonalInfoViewController alloc] initWithPersonHomeID:relationModel.homeID];
    [self presentViewController:personVC animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark HeadViewDelegate代理方法--HeadView文件中
- (void)selected:(HeadView *)view
{
    BOOL isOpen = [[headViewStatus objectForKey:@(view.section)] boolValue];
    [headViewStatus setObject:@(!isOpen) forKey:@(view.section)];
    [myTableview reloadSections:[NSIndexSet indexSetWithIndex:view.section] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark -UISearchBarDelegate
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
//{
//    [self closeKeyWindow];
//}


#pragma mark DialogView- delegate
- (void)removeRelation:(RelatedPersonCell *)cell
{
    NSInteger section = cell.tag;
//    NSInteger rowNum  = cell.rowNum;
    NSString *homeid  = cell.relationModel.homeID;
    /*/friends/cancel 取消关注 -我的关注
     /friends/remove          -我的粉丝
     /friends/remove_friend    我的朋友
     */
    NSArray *urlArray = [[NSArray alloc] initWithObjects:@"friends/remove.json",@"friends/cancel.json",@"friends/remove_friend.json", nil];
    params = [NSMutableDictionary dictionaryWithObjectsAndKeys:homeid,@"homeid", nil];
    //网络请求
    [request doPostHttpRequestWithParameters:params andURL:urlArray[section] andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *code = [responseObject objectForKey:@"code"];
        NSString *msg  = [responseObject objectForKey:@"msg"];
        
        if ([@"100" isEqualToString:code]) {
            [self loadData];
            [headViewStatus setObject:@(1) forKey:@(section)];
            [myTableview reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [self.view addSubview:alert];
            [alert show];
        }
        
        [dialogView dismiss:YES];
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark OpenDialogViewDelegate
- (void)openDialog:(RelatedPersonCell *)cell
{
    //提示框
    dialogView = [[DialogView alloc] initWithModel:cell.relationModel];
    dialogView.cell = cell;
    dialogView.delegate = self;
    
    [self.view addSubview:dialogView];
    [dialogView show];
}

#pragma mark 关闭键盘
- (void)closeKeyWindow
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [dialogView dismiss:YES];
}

- (void)closeKeyBoard:(UITapGestureRecognizer *)tap
{
//    UIView *tView = tap.view;
//    NSInteger tag = tView.tag;
//    
//    if (tag == 102) {
//        [myTableview resignFirstResponder];
//        return;
//    }
    [self closeKeyWindow];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
