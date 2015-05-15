//
//  ProtectionCell.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kProtectionCellHeight 50
@class ProtectionModel;

@interface ProtectionCell : UITableViewCell

@property(nonatomic,strong)ProtectionModel *protectionModel;

@end
