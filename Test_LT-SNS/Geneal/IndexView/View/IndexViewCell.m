//
//  IndexViewCell.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reservƒed.
//
#import "IndexViewCell.h"
#import "IndexCellModel.h"
#import "LeShiViewModel.h"
#import "HuaTiViewModel.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "UserModel.h"
#import "UIImageView+WebCache.h"
#import "IndexTableView.h"
#import "PersonalInfoViewController.h"

#define KDistanceOfViews 3
#define KNickNameH 20
#define KTitleH 20
//定义内容图片高度
#define KImageViewH 55
#define KFromH 20
#define KFromWidth 90

@interface IndexViewCell ()
{
    UIView      *viewImages;
    UITapGestureRecognizer *tapGesture;
}

@end

@implementation IndexViewCell

#pragma mark 初始化
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initComponent];
    }
    return self;
}

#pragma mark initComponent
- (void)initComponent
{
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toPersonInfo)];
    //头像
    _headImageView = [UIFactory createUserPhoto];
    [self.contentView addSubview:_headImageView];
    //信息类型
    _typeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_typeImageView];
    
    //昵称按钮
    _nickNameBtn = [UIFactory createButtonWithTitle:nil fontSize:15];
    _nickNameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_nickNameBtn addTarget:self action:@selector(toPersonInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_nickNameBtn];
    
    //正文标题
    _titleLabel = [UIFactory createLabel:nil fontSize:14];
    _titleLabel.textColor = [UIColor blueColor];
    [self.contentView addSubview:_titleLabel];
    
    //内容Label
    _contentLabel = [UIFactory createLabel:nil fontSize:13];
    _contentLabel.numberOfLines = 4;
    [_contentLabel sizeToFit];
    [self.contentView addSubview:_contentLabel];
    
    //评论Label
    _commenNumlabel = [UIFactory createLabel:nil fontSize:10];
    _commenNumlabel.userInteractionEnabled = YES;
    _commenNumlabel.tag = 101;
    [_commenNumlabel addGestureRecognizer:tapGesture];
    _commenNumlabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_commenNumlabel];
    
    //来自哪里
    _fromLabel = [UIFactory createLabel:nil fontSize:10];
    _fromLabel.userInteractionEnabled = YES;
    _fromLabel.tag = 102;
    [_fromLabel addGestureRecognizer:tapGesture];
    [self.contentView addSubview:_fromLabel];
    
    //创建时间
    _createDateLabel = [UIFactory createLabel:nil fontSize:10];
    _createDateLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_createDateLabel];
    
    //用于生成分割线
    _drawLinelabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _drawLinelabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_drawLinelabel];
    
    //被转发的数量
    _repostCount = [UIFactory createLabel:nil fontSize:10];
    _repostCount.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_repostCount];
    
    viewImages = [[UIView alloc] init];
    viewImages.hidden = YES;
    [self.contentView addSubview:viewImages];
}

#pragma mark dealTapAction处理tap手势事件
- (void)toPersonInfo
{
    NSString *homeid = nil;
    if ([_type isEqualToString:kAllIndexViewInfo]) {
        homeid = _indexCellModel.userModel.homeID;
    }
    if ([_type isEqualToString:kLeShiViewInfo]) {
        homeid = _leshiViewModel.userModel.homeID;
    }
    if ([_type isEqualToString:kHuaTiViewInfo]) {
        homeid = _huatiViewModel.userModel.homeID;
    }
    PersonalInfoViewController *personVC = [[PersonalInfoViewController alloc] initWithPersonHomeID:homeid];
    [currentVC presentViewController:personVC animated:YES completion:nil];
}

#pragma mark 计算cell高度---需要验证正确性
+ (CGFloat)getIndexCellHeight:(IndexCellModel *)model
{
    float height =10;
    height += KNickNameH + KDistanceOfViews + KTitleH + KDistanceOfViews;
    height += [IndexViewCell getTextSize:model.short_text withFont:[UIFont fontWithName:@"Helvetica" size:13]].height +KDistanceOfViews;  //正文底部高度
    if (model.img_urls.count != 0) {
        
        height += KImageViewH + KDistanceOfViews;
    }
    if (![model.ohid isEqualToString:@""]) {
        
        height += [IndexViewCell getRepostCellHeight:model.repostModel] +KDistanceOfViews;
    }
    height += KFromH +KDistanceOfViews;
    
    return height;
}

+ (CGFloat)getLeshiCellHeight:(LeShiViewModel *)model{
    
    float height = 10;
    
    height += KNickNameH + KDistanceOfViews + KTitleH + KDistanceOfViews;
    
    height += [IndexViewCell getTextSize:model.short_text withFont:[UIFont fontWithName:@"Helvetica" size:13]].height +KDistanceOfViews;  //正文底部高度
    
    if (model.img_urls.count != 0) {
        
        height += KImageViewH + KDistanceOfViews;
    }
    
    if (![model.ohid isEqualToString:@""]) {
        
        height += [IndexViewCell getRepostCellHeight:model.repostModel] + KDistanceOfViews;
    }
    
    height += KFromH;
    
    return height;
}

+ (CGFloat)getHuatiCellHeight:(HuaTiViewModel *)model
{
    float height = 10;
    
    height += KNickNameH + KDistanceOfViews +KTitleH+ KDistanceOfViews;//标题底部的高度
    
    height += [IndexViewCell getTextSize:model.short_text withFont:[UIFont fontWithName:@"Helvetica" size:13]].height +KDistanceOfViews;  //正文底部高度
    
    if (model.img_urls.count != 0) {
        
        height += KImageViewH + KDistanceOfViews;
    }
    height += KFromH;
    return height;
}

//计算转发cell高度
+(CGFloat)getRepostCellHeight:(RepostModel *)model
{
    float height = 0;
    NSString *text = [NSString stringWithFormat:@"%@ : %@",model.userModel.nick,model.short_text];
    
    height += [IndexViewCell getTextSize:text withFont:[UIFont fontWithName:@"Helvetica" size:13]].height +KDistanceOfViews;  //正文底部高度
    
    if (![model.thumbimg_url isEqualToString:@""]) {
        height += KImageViewH + KDistanceOfViews;
    }
    height += KFromH;
    return height;
}

#pragma mark 加载信息
- (void)layoutSubviews
{
    //根据数据类型加载
    if ([_type isEqualToString:kAllIndexViewInfo]) {
        
        [self layoutSubviewsWithAllIndexModel];
    }
    
    if ([_type isEqualToString:kLeShiViewInfo]) {
        
        [self layoutSubviewsWithLeshiModel];
    }
    
    if ([_type isEqualToString:kHuaTiViewInfo]) {
        
        [self layoutSubviewsWithHuatiModel];
    }
}

#pragma mark 加载所有类型的信息
- (void)layoutSubviewsWithAllIndexModel
{
    _drawLinelabel.frame = CGRectMake(0, 0, self.contentView.width, 0.3);
    //头像
    _headImageView.frame = CGRectMake(10, 10, 44, 44);
    [_headImageView addGestureRecognizer:tapGesture];
    NSURL *urlHeadPhoto = [NSURL URLWithString:_indexCellModel.userModel.curr_head];
    [_headImageView sd_setImageWithURL:urlHeadPhoto placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
    
    //信息类型
    _typeImageView.frame = CGRectMake(_headImageView.right, 22, 13, 5);
    if ([_indexCellModel.type isEqualToString:@"100"]) {
        
        _typeImageView.image = [UIImage imageNamed:@"leshi"];
    }
    
    if ([_indexCellModel.type isEqualToString:@"102"]) {
        
        _typeImageView.image = [UIImage imageNamed:@"huati"];
    }
    
    //昵称
    _nickNameBtn.frame = CGRectMake(_typeImageView.right, 10, 250 , KNickNameH);
    [_nickNameBtn setTitle:_indexCellModel.userModel.nick forState:UIControlStateNormal];
    
    //标题
    _titleLabel.frame = CGRectMake(_typeImageView.right , _nickNameBtn.bottom + KDistanceOfViews,250 ,KTitleH);
    _titleLabel.text  = _indexCellModel.title;
    
    //正文内容
    CGSize size = [IndexViewCell getTextSize:_indexCellModel.short_text withFont:_contentLabel.font];
    
    _contentLabel.frame = CGRectMake(_typeImageView.right, _titleLabel.bottom + KDistanceOfViews, self.width - _typeImageView.right, size.height);
    _contentLabel.text = _indexCellModel.short_text;
    [_contentLabel sizeToFit];
    
    float height = _contentLabel.bottom +KDistanceOfViews;
    
    if ([_indexCellModel.img_count integerValue] != 0){
        for (UIView *subv in [viewImages subviews]) {
            
            if ([subv isKindOfClass:[UIImageView class]]) {
                
                [subv removeFromSuperview];
            }
        }
        //保存图片路径
        _image_urls = [[NSMutableArray alloc] initWithArray:_indexCellModel.img_urls];
        
        int count = [_indexCellModel.img_count integerValue]>3?3:(int)_indexCellModel.img_urls.count;
    
        UIImageView *imageView = nil;
        UITapGestureRecognizer *tapGesture = nil;
        
        viewImages = [[UIView alloc] init];
        viewImages.frame = CGRectMake(_typeImageView.right, height, self.contentView.width - _typeImageView.right, KImageViewH);
            
        for (int i = 0; i< count; i++)
        {
            imageView = [[UIImageView alloc] init];
            imageView.tag = i;
            imageView.clipsToBounds = YES;
            imageView.userInteractionEnabled = YES;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.frame = CGRectMake(i * (KImageViewH + 1),0,KImageViewH,KImageViewH);
            [imageView sd_setImageWithURL:[NSURL URLWithString:[_indexCellModel.img_urls objectAtIndex:i]] placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
            
            //给图片添加手势
            tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewImage:)];
            
            [imageView addGestureRecognizer:tapGesture];
            
            [viewImages addSubview:imageView];
            
        }
        height += KImageViewH +KDistanceOfViews;
        [self.contentView addSubview:viewImages];
    }
    
    //转发
    //转发的原文显示
    if (![_indexCellModel.ohid isEqualToString:@""]) {
        
        if (_repostCellView == nil) {
            _repostCellView = [[IndexViewCell alloc] init];
        }
        _repostCellView.layer.cornerRadius = 10;
        _repostCellView.layer.borderWidth = 0.5;
        _repostCellView.layer.borderColor = [UIColor grayColor].CGColor;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRepostViewAction:)];
        [_repostCellView addGestureRecognizer:tapGesture];
        
        [self layoutSubviewsWithRepostView:height];
        [self.contentView addSubview:_repostCellView];
    }
    _commenNumlabel.frame = CGRectMake(_typeImageView.right, self.contentView.height - KFromH -1, KFromWidth, KFromH);
    _commenNumlabel.text = [NSString stringWithFormat:@"评论:%@",_indexCellModel.feedback_count];
    //朋友圈子，创建时间
    //评论数，来自哪个圈子，创建时间Label的间距
    float a = (self.contentView.width-_typeImageView.right-3*KFromWidth)/2;
    
    _fromLabel.frame = CGRectMake(_commenNumlabel.right + a,self.contentView.height - KFromH -1, KFromWidth, KFromH);
    _fromLabel.text  = _indexCellModel.from;
    
    _createDateLabel.frame = CGRectMake(self.contentView.width -KFromWidth -10, self.contentView.height - KFromH -1, KFromWidth, KFromH);
    _createDateLabel.text = _indexCellModel.create_time;
}

#pragma mark 加载话题信息
- (void)layoutSubviewsWithHuatiModel
{
    //cell分割线
    _drawLinelabel.frame = CGRectMake(0, 0, self.contentView.width, 0.3);
    //头像
    _headImageView.frame = CGRectMake(10, 10, 44, 44);
    NSURL *urlPhoto = [NSURL URLWithString:_huatiViewModel.userModel.curr_head];
    [_headImageView sd_setImageWithURL:urlPhoto placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
    //信息类型
    _typeImageView.frame = CGRectMake(_headImageView.right, 22, 13, 5);
    
    _typeImageView.image = [UIImage imageNamed:@"huati"];
    
    //昵称
    _nickNameBtn.frame = CGRectMake(_typeImageView.right, _headImageView.top, 200, KNickNameH);
    [_nickNameBtn setTitle:_huatiViewModel.userModel.nick forState:UIControlStateNormal];
    
    //标题
    _titleLabel.frame = CGRectMake(_typeImageView.right , _nickNameBtn.bottom + KDistanceOfViews, 200 ,KTitleH);
    _titleLabel.text  = _huatiViewModel.title;
    
    //正文简介
    CGSize size = [IndexViewCell getTextSize:_huatiViewModel.short_text withFont:_contentLabel.font];
    _contentLabel.frame =CGRectMake(_typeImageView.right,_titleLabel.bottom+KDistanceOfViews,size.width,size.height);
    _contentLabel.text = _huatiViewModel.short_text;
    [_contentLabel sizeToFit];

    float height = _contentLabel.bottom +KDistanceOfViews;

    //图像显示区域
    if ([_huatiViewModel.img_count integerValue] != 0) {
        
        _image_urls = [[NSMutableArray alloc] initWithArray:_huatiViewModel.img_urls];
        
        for (UIView *subv in [viewImages subviews]) {
            
            if ([subv isKindOfClass:[UIImageView class]]) {
                
                [subv removeFromSuperview];
            }
        }
        int count = _huatiViewModel.img_urls.count>3?3:(int)_huatiViewModel.img_urls.count;
    
        viewImages.hidden = NO;
        viewImages.frame =CGRectMake(_typeImageView.right,height,self.contentView.width-_typeImageView.right, KImageViewH);
        
        UIImageView *imageView = nil;
        for (int i = 0; i< count; i++) {
            imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * (KImageViewH + 1), 0, KImageViewH, KImageViewH)];
            imageView.tag = i;
            [imageView sd_setImageWithURL:[NSURL URLWithString:[_huatiViewModel.img_urls objectAtIndex:i]] placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
            
            imageView.userInteractionEnabled = YES;
            //给图片添加手势
             UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewImage:)];
            [imageView addGestureRecognizer:tapGesture];
            
            [viewImages addSubview:imageView];
        }
    }
    _commenNumlabel.frame = CGRectMake(_typeImageView.right, self.contentView.height-KFromH-1, KFromWidth, KFromH);
    _commenNumlabel.text = [NSString stringWithFormat:@"评论：%@",_huatiViewModel.feedback_count];
    //朋友圈子，创建时间
    //评论数，来自哪个圈子，创建时间Label的间距
    float a = (self.contentView.width-_typeImageView.right-3*KFromWidth)/2;
    _fromLabel.text  = _huatiViewModel.client;
    _fromLabel.frame = CGRectMake(_commenNumlabel.right + a, self.contentView.height- KFromH- 1, KFromWidth, KFromH);
    _createDateLabel.text = _huatiViewModel.create_time;
    _createDateLabel.frame = CGRectMake(_fromLabel.right + a-10, self.contentView.height - KFromH - 1, KFromWidth, KFromH);
}

#pragma mark 加载乐事信息
- (void)layoutSubviewsWithLeshiModel
{
    //头像
    _headImageView.frame = CGRectMake(10, 10, 44, 44);
    NSURL *urlHeadPhoto = [NSURL URLWithString:_leshiViewModel.userModel.curr_head];
    [_headImageView sd_setImageWithURL:urlHeadPhoto placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
    
    //信息类型
    _typeImageView.frame = CGRectMake(_headImageView.right, 22, 13, 5);
    _typeImageView.image = [UIImage imageNamed:@"leshi"];
    
    //昵称
    _nickNameBtn.frame = CGRectMake(_typeImageView.right, _headImageView.top, 200, KNickNameH);
    [_nickNameBtn setTitle:_leshiViewModel.userModel.nick forState:UIControlStateNormal];
    
    //正文简介
    _contentLabel.text = _leshiViewModel.short_text;
    [_contentLabel sizeToFit];
    _contentLabel.textColor = [UIColor blueColor];
    CGSize textSize = [IndexViewCell getTextSize:_contentLabel.text withFont:_contentLabel.font];
    _contentLabel.frame = CGRectMake(_typeImageView.right, _nickNameBtn.bottom+KDistanceOfViews, textSize.width, textSize.height);
    float height = _contentLabel.bottom;
    //图片
    if ([_leshiViewModel.img_count integerValue] != 0) {
        //如果有图片
        for (UIView *subv in [viewImages subviews]) {
            
            if ([subv isKindOfClass:[UIImageView class]]) {
                
                [subv removeFromSuperview];
            }
        }
        _image_urls = [[NSMutableArray alloc] initWithArray:_leshiViewModel.img_urls];
        
        int count = _leshiViewModel.img_urls.count > 3 ? 3 : (int)_leshiViewModel.img_urls.count;
        
        UIImageView *imageView = nil;
        UITapGestureRecognizer *tapGesture = nil;
        
        viewImages = [[UIView alloc] init];
        viewImages.frame = CGRectMake(_typeImageView.right, height, self.contentView.width - _typeImageView.right, KImageViewH);
        
        for (int i = 0; i< count; i++)
        {
            imageView = [[UIImageView alloc] init];
            imageView.tag = i;
            imageView.clipsToBounds = YES;
            imageView.userInteractionEnabled = YES;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            //_typeImageView.right + i * (KImageViewH + 1), height, KImageViewH, KImageViewH
            imageView.frame = CGRectMake(i * (KImageViewH + 1),0,KImageViewH,KImageViewH);
            [imageView sd_setImageWithURL:[NSURL URLWithString:[_leshiViewModel.img_urls objectAtIndex:i]] placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
            //给图片添加手势
            tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewImage:)];
            
            [imageView addGestureRecognizer:tapGesture];
            
            [viewImages addSubview:imageView];
            
        }
        [self.contentView addSubview:viewImages];
        height += KImageViewH +KDistanceOfViews;
    }
    
    //转发的原文显示
    //判断如果repostModel中有内容则生成转发原文的view
    if (![_leshiViewModel.ohid isEqualToString:@""]) {
        
        if (_repostCellView == nil) {
            _repostCellView = [[IndexViewCell alloc] initWithFrame:CGRectZero];
        }
        
        _repostCellView.layer.cornerRadius = 10;
        _repostCellView.layer.borderWidth = 0.5;
        _repostCellView.layer.borderColor = [UIColor grayColor].CGColor;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRepostViewAction:)];
        [_repostCellView addGestureRecognizer:tapGesture];
        
        [self layoutSubviewsWithRepostView:height];
        [self.contentView addSubview:_repostCellView];
    }
    
    _commenNumlabel.frame = CGRectMake(_typeImageView.right, self.contentView.height - KFromH -0.3, KFromWidth, KFromH);
    _commenNumlabel.text = [NSString stringWithFormat:@"评论:%@",_leshiViewModel.feedback_count];
    //朋友圈子，创建时间
    //评论数，来自哪个圈子，创建时间Label的间距
    float a = (self.contentView.width-_typeImageView.right-3*KFromWidth)/2;
    
    _fromLabel.frame = CGRectMake(_commenNumlabel.right + a, _commenNumlabel.top, KFromWidth, KFromH);
    _fromLabel.text  = _leshiViewModel.client;
    
    _createDateLabel.frame = CGRectMake(_fromLabel.right + a-10, _commenNumlabel.top, KFromWidth, KFromH);
    _createDateLabel.text = _leshiViewModel.create_time;
    
    _drawLinelabel.frame = CGRectMake(0, 0, self.contentView.width, 0.3);
    
}

#pragma mark 加载转发的原文
- (void)layoutSubviewsWithRepostView:(float)height
{
    _repostCellView.typeImageView.hidden = YES;
    _repostCellView.titleLabel.hidden = YES;
    _repostCellView.fromLabel.hidden = YES;
    RepostModel *_repostModel = nil;
    
    if ([self.type isEqualToString:kAllIndexViewInfo]) {
    
        _repostModel = _indexCellModel.repostModel;
    }
    
    if ([self.type isEqualToString:kLeShiViewInfo]) {
        
        _repostModel = _leshiViewModel.repostModel;
    }
    
    [self layoutRepostView:_repostCellView withModel:_repostModel andHeight:height];
    
}

#pragma mark 转发的原文view内部根据Model类型布局
- (void)layoutRepostView:(IndexViewCell *)cell withModel:(RepostModel *)_repostModel andHeight :(float)high
{
    float cellHeight = [IndexViewCell getRepostCellHeight:_repostModel];
    
    cell.frame = CGRectMake(_typeImageView.right, high, SCREEN_WIDTH-_typeImageView.right-10, cellHeight);

    //昵称+内容文本
    cell.contentLabel.text = [NSString stringWithFormat:@"%@ : %@",_repostModel.userModel.nick,_repostModel.short_text];
    [cell.contentLabel sizeToFit];
    //计算文本大小
    CGSize textSize = [IndexViewCell getTextSize:cell.contentLabel.text withFont:cell.contentLabel.font];
    
    cell.contentLabel.frame = CGRectMake(7, 7, textSize.width-10, textSize.height);
    
    UIImageView *imageView = nil;
    if (![_repostModel.thumbimg_url isEqualToString:@""]) {
        //有图片
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(cell.contentLabel.left, cell.contentLabel.bottom , KImageViewH, KImageViewH)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:_repostModel.thumbimg_url] placeholderImage:[UIImage imageNamed:@""]];//close_btn
        
        [cell.contentView addSubview:imageView];
    }
    
    //最后一行  时间，评论数，转发数组件之间的间隔
    float a = (SCREEN_WIDTH - 3 * KFromWidth - _typeImageView.right ) / 2 ;
    
    //评论数
    cell.commenNumlabel.frame = CGRectMake(cell.contentLabel.left, cellHeight - KFromH, KFromWidth, KFromH);
    cell.commenNumlabel.text = [NSString stringWithFormat:@"评论:%@",_repostModel.feedback_count];
    
    //转发数
    cell.repostCount.frame = CGRectMake(cell.commenNumlabel.right + a, cellHeight - KFromH, KFromWidth, KFromH);
    cell.repostCount.text = [NSString stringWithFormat:@"转发:%@",_repostModel.share_count];
    
    cell.createDateLabel.frame = CGRectMake(cell.repostCount.right + a-30,cellHeight-KFromH,KFromWidth,KFromH);
    cell.createDateLabel.text = _repostModel.create_time;

}

#pragma mark 点击图片放大
- (void)viewImage:(UITapGestureRecognizer *)gesture
{
    NSInteger index = gesture.view.tag;
    NSMutableArray *_photoArrays = [[NSMutableArray alloc] init];
    
    for (int i = 0; i< _image_urls.count; i++) {
        // 替换为中等尺寸图片
        NSString *url = [_image_urls objectAtIndex:i];
        
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.url = [NSURL URLWithString:url]; // 图片路径
        [_photoArrays addObject:photo];
    }
    
    MJPhotoBrowser *photoBrowser = [[MJPhotoBrowser alloc] init];
    photoBrowser.photos = _photoArrays;
    photoBrowser.currentPhotoIndex = index;
    
    [photoBrowser show];
    
}

#pragma mark tapRepostViewAction
- (void)tapRepostViewAction:(UITapGestureRecognizer *)tapGesture
{
    self.indexDelegate =_indexTableView;
    
    if ([_type isEqualToString:kLeShiViewInfo]) {
        
        if ([self.indexDelegate respondsToSelector:@selector(openLeshiDetailVC:)]) {
            [self.indexDelegate openLeshiDetailVC:_leshiViewModel];
        }
    }
}

#pragma mark 计算文本内容大小
+(CGSize)getTextSize:(NSString *)str withFont:(UIFont *)dateFont
{
    CGSize maximumSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-70, MAXFLOAT);
    
    CGSize dateStringSize = [str sizeWithFont:dateFont
                            constrainedToSize:maximumSize
                                lineBreakMode:NSLineBreakByWordWrapping];
    UILabel *label = [[UILabel alloc] init];
    label.text = str;
    CGRect myFrame = CGRectMake(0, 0, dateStringSize.width, dateStringSize.height);
    label.numberOfLines = 4;
    label.frame = myFrame;
    [label sizeToFit];
    
    return label.size;
}

//
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end