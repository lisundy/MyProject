//
//  HotPeopleViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/23.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HotPeopleViewController.h"
#import "HotPeopleView.h"
#import "HotPeopleModel.h"
#import "PersonalInfoViewController.h"

#import "UIUtils.h"
#import "RequestUtils.h"

#define kSize @"20"

@interface HotPeopleViewController ()

{
    __block NSString *indexString;
}

@property(nonatomic,strong)HotPeopleView *hotPeopleView;

@property(nonatomic,strong)NSNumber *totalCount;

@property(nonatomic,strong)NSNumber *totalPageCount;

@property(nonatomic,strong)NSMutableArray *hotPeopleModels;

@property(nonatomic,assign)NSInteger selectedIndex;

@end

@implementation HotPeopleViewController


-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationHotPeopleCellDidSelected object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationHotPeopleViewSegmentControlValueChange object:nil];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    indexString = @"1";
    
    self.hotPeopleModels = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hotPeopleCellDidSelected:) name:kNotificationHotPeopleCellDidSelected object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(segmentControlValueChange:) name:kNotificationHotPeopleViewSegmentControlValueChange object:nil];
    
    __weak __typeof(&*self)weakSelf = self;
    _hotPeopleView = [[HotPeopleView alloc] initWithFrame:self.homeView.contentView.bounds andHeaderRefreshBlock:^{
        
    } FooterRefreshBlock:^{
        NSInteger i = [indexString integerValue];
        indexString = [NSString stringWithFormat:@"%ld",++i];
        [weakSelf doRefresh];
    }];
    [self.homeView.contentView addSubview:_hotPeopleView];
    
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.homeView.navigationView.navigationTitle = @"热门人物";
    self.homeView.navigationView.leftButton = backButton;
    
    [self doRequestWithSelectedIndex:0];
    
}

-(void)segmentControlValueChange:(NSNotification *)notification{
    indexString = @"1";
    [((NSMutableArray *)_hotPeopleView.hotPeopleModels) removeAllObjects] ;
    [((NSMutableArray *)_hotPeopleModels) removeAllObjects];
    NSDictionary *userInfo = notification.userInfo;
    self.selectedIndex = [[userInfo objectForKey:@"selectedIndex"] integerValue];
    [self doRequestWithSelectedIndex:_selectedIndex];
}


-(void)doRequestWithSelectedIndex:(NSInteger)selectedIndex{
    NSString *token = [UIUtils getToken];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"token":token,
                                                                                  @"index":indexString,
                                                                                  @"size":kSize
                                                                                  }];
    
    if (_selectedIndex == SelectedIndexAll) {
        [dict setObject:@"FollowNum" forKey:@"sort"];
    }else if(_selectedIndex == SelectedIndexMale){
        [dict setObject:@"0" forKey:@"sex"];
    }else if(_selectedIndex == SelectedIndexFemale){
        [dict setObject:@"1" forKey:@"sex"];
    }
    RequestUtils *request = [[RequestUtils alloc] init];
    [request doGetHttpRequestWithParameters:dict
                                     andURL:@"exten/user_list.json"
                                 andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                                     [self fillData:responseObject];
                                     [_hotPeopleView endRefresh];
                                 }
                                 andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                     
                                 }];
}

-(NSNumber *)totalPageCount{
    NSInteger totalCount = [_totalCount integerValue];
    
    NSInteger totalPage = (totalCount + [kSize integerValue] -1)/[kSize integerValue];
    
    return [NSNumber numberWithInteger:totalPage];
}

-(void)fillData:(id)responseObject{
    _totalCount = [responseObject objectForKey:@"total_count"];
    indexString = [responseObject objectForKey:@"curr_index"];
    NSArray *dicts = [responseObject objectForKey:@"obj"];
    
    for (NSDictionary *dict in dicts) {
        HotPeopleModel *model = [[HotPeopleModel alloc] initWithDictionary:dict];
        [_hotPeopleModels addObject:model];
    }
    _hotPeopleView.hotPeopleModels = _hotPeopleModels;
}

-(void)doRefresh{
    if ([indexString integerValue]>[self.totalPageCount integerValue]) {
        [_hotPeopleView endRefresh];
        NSInteger i = [indexString integerValue];
        indexString = [NSString stringWithFormat:@"%ld",--i];
    }else{
        [self doRequestWithSelectedIndex:self.selectedIndex];
    }
}

-(void)backButtonClick:(UIButton *)backButton{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)hotPeopleCellDidSelected:(NSNotification *)notification{
    PersonalInfoViewController *infoViewController = [[PersonalInfoViewController alloc] initWithPersonHomeID:[notification.userInfo objectForKey:@"homeId"]];
    
    [self presentViewController:infoViewController animated:YES completion:^{
        
    }];
    //[self presentModalViewController:infoViewController animated:YES];
    [self performSelector:@selector(doNothing) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
}
-(void)doNothing{

}


@end
