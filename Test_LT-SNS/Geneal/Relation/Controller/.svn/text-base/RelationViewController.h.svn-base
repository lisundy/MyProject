//
//  RelationViewController.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseViewController.h"

@class RelatedPersonCell;
@interface RelationViewController : BaseViewController

@end

//对好友关系进行删除的协议
@protocol RelationVCDelegate <NSObject>

- (void)removeRelation:(RelatedPersonCell *)cell;

@end

//弹出提示框
@protocol OpenDialogViewDelegate <NSObject>

- (void)openDialog:(RelatedPersonCell *)cell;

@end