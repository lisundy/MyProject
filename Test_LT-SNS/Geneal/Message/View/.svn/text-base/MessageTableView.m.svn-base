//
//  MessageTableView.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "MessageTableView.h"
#import "MessageCellModel.h"
#import "MessageViewCell.h"
#import "MessageViewController.h"

#define MsgCellImgHeight 44

@interface MessageTableView () <UITableViewDataSource,UITableViewDelegate>
{
    MessageCellModel *messageCellModel;
    NSArray          *arrayVC;
}
@end

@implementation MessageTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        self.tableFooterView = [[UIView alloc] init];
        
        //初始化数据
        [self initData];

    }
    
    return self;
}

#pragma mark initData
- (void)initData
{
    arrayVC = [[NSArray alloc] initWithObjects:
                                        @"AtMeCommentVController",
                                        @"RecieveCommentVController",
                                        @"ValidateVController",
                                        @"AtMeLeshiVController", nil];
    
    ///athappymsg_number/atcomment_number/tocomment_number/verify_number
    
}

#pragma mark tableview-dataSource方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdetifier = @"cellIdetifier";
    
    MessageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdetifier];
    
    messageCellModel = [_data objectAtIndex:indexPath.row];
    
    if (cell == nil) {
        cell = [[MessageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdetifier];
    }
    messageCellModel.count = [_newsCount objectAtIndex:indexPath.row];
    cell.messageModel = messageCellModel;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCellModel *messageModel = [_data objectAtIndex:indexPath.row];
    
    return [MessageViewCell getMesgCellHeight:messageModel];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2.0;
}

//选择某一项
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger select = indexPath.row;
    
    if ([@"0" isEqualToString:[_newsCount objectAtIndex:select]] && select==2) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"没有新消息" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [currentVC.view addSubview:alert];
        [alert show];
        
    }else{
        
        BaseViewController *baseVC = [[NSClassFromString([arrayVC objectAtIndex:select]) alloc] init];
        [currentVC pushVCWithAnimation:baseVC];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
