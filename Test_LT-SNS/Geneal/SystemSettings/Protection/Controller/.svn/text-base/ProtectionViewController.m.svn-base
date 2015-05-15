//
//  ProtectionViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "ProtectionViewController.h"
#import "ProtectionTableView.h"
#import "ProtectionModel.h"

#import "UIUtils.h"
#import "RequestUtils.h"

@interface ProtectionViewController ()
{
    NSMutableArray *protectionModels;
}
@property(nonatomic,strong)ProtectionTableView *tableView;

@end

@implementation ProtectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homeView.navigationView.navigationTitle = @"账号保护";
    
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.homeView.navigationView.leftButton = backButton;
    
    UILabel *authorizedDevicesLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, kScreenWidth-15, 44)];
    authorizedDevicesLabel.text = @"已授权的设备";
    [self.homeView.contentView addSubview:authorizedDevicesLabel];
    
    CGFloat borderOffset = 5;
    _tableView = [[ProtectionTableView alloc] initWithFrame:CGRectMake(borderOffset, CGRectGetMaxY(authorizedDevicesLabel.frame), kScreenWidth-2*borderOffset, self.homeView.contentView.bounds.size.height-CGRectGetHeight(authorizedDevicesLabel.frame)-borderOffset) style:UITableViewStylePlain];
    _tableView.layer.masksToBounds = YES;
    _tableView.layer.cornerRadius = 10.0f;
    _tableView.layer.borderWidth = 1;
    _tableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.homeView.contentView addSubview:_tableView];
    
    protectionModels = [[NSMutableArray alloc] init];
    
    NSString *token = [UIUtils getToken];
    RequestUtils *request = [[RequestUtils alloc] init];
    [request doGetHttpRequestWithParameters:@{@"token":token}
                                     andURL:@"/users/my_device.json"
                                 andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                                     NSLog(@"%@",responseObject);
                                     NSArray *devices = [responseObject valueForKey:@"obj"];
                                     for (NSDictionary *dict in devices) {
                                         NSLog(@"----------%@",dict);
                                         ProtectionModel *model = [[ProtectionModel alloc] initWithDictionary:dict];
                                         [protectionModels addObject:model];
                                     }
                                     _tableView.protectionModelsArray = protectionModels;
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

-(void)backButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
