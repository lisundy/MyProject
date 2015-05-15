//
//  DialogView.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"

@class RelationModel;
@class RelatedPersonCell;

@protocol RelationVCDelegate;

@interface DialogView : BaseView

@property (retain, nonatomic) RelationModel             *model;
@property (weak, nonatomic) id<RelationVCDelegate>  delegate;
@property (weak, nonatomic) RelatedPersonCell       *cell;
@property (retain, nonatomic) BaseView              *dialogView;

- (instancetype)initWithModel:(RelationModel *)relationModel;

- (void)show;

- (void)dismiss:(BOOL)animated;
@end
