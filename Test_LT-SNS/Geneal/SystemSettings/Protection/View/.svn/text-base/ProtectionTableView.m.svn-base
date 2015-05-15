//
//  ProtectionTableView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "ProtectionTableView.h"
#import "ProtectionCell.h"
#import "ProtectionModel.h"
@interface ProtectionTableView()<UITableViewDataSource,UITableViewDelegate>



@end

@implementation ProtectionTableView



//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.delegate = self;
//        self.dataSource = self;
//    }
//    return self;
//}

-(void)setProtectionModelsArray:(NSMutableArray *)protectionModelsArray{
    _protectionModelsArray = protectionModelsArray;
    [self reloadData];
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _protectionModelsArray = [[NSMutableArray alloc] init];
//        @autoreleasepool {
//            for (NSInteger i = 0; i<10; i++) {
//                ProtectionModel *model = [[ProtectionModel alloc] init];
//                model.device_name = @"我是设备名称";
//                model.login_time = @"我是登陆时间";
//                [_protectionModelsArray addObject:model];
//            }
//        }
    }
    return self;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.protectionModelsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"ProtectionCell";
    ProtectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ProtectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.protectionModel = [self.protectionModelsArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kProtectionCellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
