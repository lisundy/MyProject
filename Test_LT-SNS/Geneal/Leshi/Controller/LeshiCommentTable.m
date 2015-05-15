//
//  LeshiCommentTable.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "LeshiCommentTable.h"
#import "CommentModel.h"
#import "CommentFirstCell.h"
#import "CommentSecondCell.h"
#import "CommentThridCell.h"

#define FirstCellIdentifier @"firstCellIdentifier"
#define SecondCellIdentifier @"secondCellIdentifier"
#define ThirdCellIdentifier @"ThirdCellIdentifier"

@interface LeshiCommentTable () <UITableViewDataSource,UITableViewDelegate>


@property(retain, nonatomic) CommentModel *commentModel;

@end

@implementation LeshiCommentTable

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    
    return self;
}

#pragma mark TableView datasource&delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allCommentData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _commentModel = [_allCommentData objectAtIndex:indexPath.row];
    
    if ([_commentModel.layer isEqualToString:@"1"]) {
        
        CommentFirstCell *firstCell = [tableView dequeueReusableCellWithIdentifier:FirstCellIdentifier];
        
        if (firstCell == nil) {
            
            firstCell = [[CommentFirstCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FirstCellIdentifier];
        }
        firstCell.commentModel = _commentModel;
        
        return firstCell;
        
    }else if ([_commentModel.layer isEqualToString:@"2"]) {
        
        CommentSecondCell *secondCell = [tableView dequeueReusableCellWithIdentifier:SecondCellIdentifier];
        
        if (secondCell == nil) {
            
            secondCell = [[CommentSecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SecondCellIdentifier];
        }
        secondCell.commentModel = _commentModel;
        
        return secondCell;
        
    }else {
        
        CommentThridCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:ThirdCellIdentifier];
        
        if (thirdCell == nil) {
            
            thirdCell = [[CommentThridCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ThirdCellIdentifier];
        }
        thirdCell.commentModel = _commentModel;
        
        return thirdCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = 0;
    
    _commentModel = [_allCommentData objectAtIndex:indexPath.row];
    
    if ([_commentModel.layer isEqualToString:@"1"]) {
        
        height = [CommentFirstCell getCellHeightWithModel:_commentModel];
        
    }else if ([_commentModel.layer isEqualToString:@"2"])
    {
        height = [CommentSecondCell getCellHeightWithModel:_commentModel];
        
    }else
    {
        height = [CommentThridCell getCellHeightWithModel:_commentModel];
    }
    
    height += 10;
    
    _totalHeigh += height;
    
    return height;
}

#pragma mark 计算tableview总高
+ (CGFloat) getTableviewHeight:(NSMutableArray *)data
{
    
    float totalHeight = 0;
    CommentModel * commentModel = nil;
    for (int i = 0; i< data.count; i++) {
        float height = 0;
        
        commentModel = [data objectAtIndex:i];
        
        if ([commentModel.layer isEqualToString:@"1"]) {
            
            height = [CommentFirstCell getCellHeightWithModel:commentModel];
            
        }else if ([commentModel.layer isEqualToString:@"2"])
        {
            height = [CommentSecondCell getCellHeightWithModel:commentModel];
            
        }else
        {
            height = [CommentThridCell getCellHeightWithModel:commentModel];
        }
        
        height += 10;
        
        totalHeight += height;
    }
    return totalHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
