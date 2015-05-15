//
//  RelatedPersonCell.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RelationModel;

@protocol OpenDialogViewDelegate;

@interface RelatedPersonCell : UITableViewCell

@property (retain, nonatomic) RelationModel *relationModel;
@property (weak, nonatomic) id<OpenDialogViewDelegate> delegate;

@property (nonatomic) NSInteger rowNum;
@end


