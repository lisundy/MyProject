//
//  AboutCircleMidView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "AboutCircleMidView.h"
#import "AboutCircleMidCell.h"
#import "AboutCircleFrame.h"

@interface AboutCircleMidView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation AboutCircleMidView

- (instancetype)initWithFrame:(CGRect)frame aboutCircleFrames:(NSArray *)aboutCircleFrames
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _aboutCircleFrames = aboutCircleFrames;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
        
    }
    return self;
}

#pragma mark - tableView
#pragma mark 数据源方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"aboutCircleMidViewCell";
    AboutCircleMidCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[AboutCircleMidCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.aboutCircleFrame = [_aboutCircleFrames objectAtIndex:indexPath.row];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _aboutCircleFrames.count;
}

#pragma mark 代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return ((AboutCircleFrame *)[_aboutCircleFrames objectAtIndex:indexPath.row]).cellHeight;
}

@end
