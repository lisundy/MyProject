//
//  PersonalInfoViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/30.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalInfoViewController.h"

#import "PersonalInfoTableView.h"

#import "UIUtils.h"
#import "RequestUtils.h"

#import "PersonalIntroductionModel.h"
#import "PersonalLeshiModel.h"
#import "PersonalLeshiFrame.h"

#define kSize @"20"

@interface PersonalInfoViewController ()
{
    __block NSString *indexString;
}
@property(nonatomic,copy)NSString *homeId;
@property(nonatomic,copy)PersonalInfoTableView *infoTableView;



@property(nonatomic,strong)NSNumber *totalCount;

@property(nonatomic,strong)NSNumber *totalPageCount;

@property(nonatomic,strong)NSMutableArray *leshiFrames;

@end

@implementation PersonalInfoViewController

-(id)initWithPersonHomeID:(NSString *)homeId{
    self = [super init];
    if (self) {
        self.homeId = homeId;
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    indexString = @"1";
    
    self.leshiFrames = [[NSMutableArray alloc] init];
    
    self.homeView.navigationView.navigationTitle = @"用户信息";
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.homeView.navigationView.leftButton = backButton;
    
    __weak __typeof(&*self)weakSelf = self;
    _infoTableView = [[PersonalInfoTableView alloc] initWithFrame:self.homeView.contentView.bounds style:UITableViewStylePlain andHeaderRefreshBlock:^{
        
    } FooterRefreshBlock:^{
        NSInteger i = [indexString integerValue];
        indexString = [NSString stringWithFormat:@"%ld",++i];
        [weakSelf doRefresh];
    }];
    
    [self.homeView.contentView addSubview:_infoTableView];
    
    [self doRequestPersonalInfo];
    
    [self doRequestLeshi];
}

-(void)doRequestPersonalInfo{
    NSString *token = [UIUtils getToken];
    RequestUtils *request = [[RequestUtils alloc] init];
    [request doGetHttpRequestWithParameters:@{
                                              @"token":token,
                                              @"homeid":self.homeId
                                              }
                                     andURL:@"users/other.json"
                                 andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                                     [self fillData:responseObject];
                                     
                                     } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         
                                     }];
}

-(void)doRequestLeshi{
    NSString *token = [UIUtils getToken];
    RequestUtils *request = [[RequestUtils alloc] init];
    [request doGetHttpRequestWithParameters:@{
                                              @"token":token,
                                              @"homeid":self.homeId,
                                              @"size":kSize,
                                              @"index":indexString
                                              }
                                     andURL:@"ls/other_list.json"
                                 andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                                     
                                     [self fillLeshiData:responseObject];
                                     [_infoTableView endRefresh];
                                 } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                     
                                 }];
}

-(void)fillData:(id)responseObject{
    PersonalIntroductionModel *model = [[PersonalIntroductionModel alloc] initWithDictionary:(NSDictionary *)responseObject];
    _infoTableView.personalIntroductionModel = model;
}

-(NSNumber *)totalPageCount{
    NSInteger totalCount = [_totalCount integerValue];
    
    NSInteger totalPage = (totalCount + [kSize integerValue] -1)/[kSize integerValue];
    
    return [NSNumber numberWithInteger:totalPage];
}



-(void)fillLeshiData:(id)responseObject{
    NSArray *objs = [responseObject objectForKey:@"obj"];
    _totalCount = [responseObject objectForKey:@"total_count"];
    indexString = [responseObject objectForKey:@"curr_index"];
    for (NSDictionary *dict in objs) {
        PersonalLeshiFrame *leshiFrame = [[PersonalLeshiFrame alloc] init];
        PersonalLeshiModel *model = [[PersonalLeshiModel alloc] initWithDictionary:dict];
        leshiFrame.personalLeshiModel = model;
        [_leshiFrames addObject:leshiFrame];
    }
    [_infoTableView setPersonalLeshiFrames:_leshiFrames];
}

-(void)doRefresh{
    
    if ([indexString integerValue]>[self.totalPageCount integerValue]) {
        [_infoTableView endRefresh];
        NSInteger i = [indexString integerValue];
        indexString = [NSString stringWithFormat:@"%ld",--i];
    }else{
        [self doRequestLeshi];
    }
}

-(void)backButtonClick:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
