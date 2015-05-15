//
//  PersonalLeshiFrame.h
//  Test_LT-SNS
//
//  Created by Dev on 15/5/4.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PersonalLeshiModel;

@interface PersonalLeshiFrame : NSObject

@property(nonatomic,strong)PersonalLeshiModel *personalLeshiModel;

@property(nonatomic,assign,readonly)CGRect nameLabelFrame;
@property(nonatomic,assign,readonly)CGRect sendDateLabelFrame;
@property(nonatomic,assign,readonly)CGRect pinglunImageViewFrame;
@property(nonatomic,assign,readonly)CGRect pinglunCountLabelFrame;
@property(nonatomic,assign,readonly)CGRect leshiContentLabelFrame;
@property(nonatomic,assign,readonly)CGRect leshiImageViewFrame;

@property(nonatomic,assign,readonly)CGFloat cellHeight;

@end

