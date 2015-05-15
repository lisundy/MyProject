//
//  MyIDListCell.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMyIDListCellHeight 50

@class MyIDListModel;

@interface MyIDListCell : UITableViewCell

@property(nonatomic,strong)MyIDListModel *myIDModel;

@end
