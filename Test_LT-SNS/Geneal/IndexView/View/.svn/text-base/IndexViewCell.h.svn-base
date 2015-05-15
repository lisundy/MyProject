//
//  IndexViewCell.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "UIViewExt.h"


@class IndexCellModel,LeShiViewModel,HuaTiViewModel,RepostModel,IndexTableView;

@protocol IndexTableViewDelegate;

@interface IndexViewCell : UITableViewCell

@property (retain, nonatomic) UIImageView *headImageView;           //头像
@property (retain, nonatomic) UIImageView *typeImageView;           //信息类型
@property (retain, nonatomic) UIButton *nickNameBtn;                //昵称
@property (retain, nonatomic) UILabel *titleLabel;                  //信息标题
@property (retain, nonatomic) UILabel *contentLabel;                //信息简介
@property (retain, nonatomic) UILabel *commenNumlabel;                   //评论数
@property (retain, nonatomic) UILabel *fromLabel;                   //来自哪个圈子
@property (retain, nonatomic) UILabel *createDateLabel;             //创建日期
@property (retain, nonatomic) UILabel *drawLinelabel;               //画线--cell分割线

//@property (retain, nonatomic) UIImageView *_imageView;            //图片信息
@property (retain, nonatomic) NSMutableArray *_imageArray;          //图片信息
@property (retain, nonatomic) NSString *type;                       //用来保存Cell信息类型

@property (retain, nonatomic) IndexViewCell *repostView;            //转发原文的view

@property (retain, nonatomic) IndexCellModel *indexCellModel;      //首页cell所有数据model
@property (retain, nonatomic) LeShiViewModel *leshiViewModel;      //乐事cell model
@property (retain, nonatomic) HuaTiViewModel *huatiViewModel;      //话题cell model
@property (retain, nonatomic) NSMutableArray *image_urls;           //用来保存当前模型中的图片路径

//转发原文显示的内容组件
@property (retain, nonatomic) UILabel *repostCount;                 //被转发数量
@property (retain, nonatomic) UILabel *repostCreateDateLabel;       //转发内容创建时间

@property (retain, nonatomic) IndexViewCell *repostCellView;
@property (weak, nonatomic) id<IndexTableViewDelegate> indexDelegate;//代理对象
@property (retain, nonatomic) IndexTableView *indexTableView;       //

+(CGFloat)getIndexCellHeight:(IndexCellModel *)model;               //所有信息中每个cell的高度
+(CGFloat)getLeshiCellHeight:(LeShiViewModel *)model;               //乐事信息cell高度
+(CGFloat)getHuatiCellHeight:(HuaTiViewModel *)model;               //话题信息cell高度
+(CGFloat)getRepostCellHeight:(RepostModel *)model;
@end

