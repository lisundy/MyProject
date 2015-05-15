//
//  HeadView.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeadViewDelegate;


@class RelationGropModel;
@interface HeadView : UITableViewHeaderFooterView

@property (assign, nonatomic) BOOL isOpen;
@property (assign, nonatomic) NSInteger section;
@property (retain, nonatomic) NSString *groupName;
@property (assign, nonatomic) id<HeadViewDelegate> delegate;

+(instancetype)headerWithTableView:(UITableView *)tableView;

@end

@protocol HeadViewDelegate <NSObject>

- (void)selected:(HeadView *)view;
@end