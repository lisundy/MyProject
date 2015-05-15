//
//  ProtectionCell.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "ProtectionCell.h"
#import "ProtectionModel.h"

@interface ProtectionCell()
{
    
    /**
     "device_name" = "IPhone\U2014x86_64";
     id = 10000132;
     "is_limit" = 0;
     "is_login" = 0;
     "login_time" = "2014-06-11 11:45:21";
     **/
    UILabel *deviceNameLabel;   //设备名称标签
    UILabel *loginTimeLabel;    //登陆时间标签
    UIButton *modifyButton;     //“修改”按钮
    UIButton *prohibitButton;   //“禁止”按钮
    UILabel *bottomLineLabel;   //底部下划线
}


@end


@implementation ProtectionCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //设置cell被选中时，不显示任何颜色变化
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //屏幕宽度
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        //border 为距离左、右屏幕边框，距离下方控件的距离
        CGFloat border = 5;
        //设置label的宽度为，除了边距外，占用剩下距离的60%
        CGFloat labelWidth = (screenWidth-2*border) * 0.6;
        //label的高度为22
        CGFloat labelHeight = 22;
        //按钮的宽度
        CGFloat buttonWidth = 50;
        //按钮的高度
        CGFloat buttonHeight = 35;
        //按钮的Y值
        CGFloat buttonY = kProtectionCellHeight/2-buttonHeight/2;
        
        deviceNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(border, 0, labelWidth, labelHeight)];
        
        
        loginTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(border, CGRectGetMaxY(deviceNameLabel.frame)+5, labelWidth, labelHeight)];
        loginTimeLabel.font = [UIFont systemFontOfSize:13];
        
        
        //新建“修改”按钮
        modifyButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(deviceNameLabel.frame)+5, buttonY , buttonWidth, buttonHeight)];
        modifyButton.layer.masksToBounds = YES;
        modifyButton.layer.cornerRadius = 10.0f;
        modifyButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [modifyButton setTitle:@"修改" forState:UIControlStateNormal];
        [modifyButton setBackgroundColor:[UIColor lightGrayColor]];
        [modifyButton addTarget:self action:@selector(modifyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:modifyButton];
        
        //新建“禁止”按钮
        prohibitButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(modifyButton.frame)+5, buttonY , buttonWidth, buttonHeight)];
        prohibitButton.layer.masksToBounds = YES;
        prohibitButton.layer.cornerRadius = 10.0f;
        prohibitButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [prohibitButton setTitle:@"禁止" forState:UIControlStateNormal];
        [prohibitButton setBackgroundColor:[UIColor redColor]];
        [prohibitButton addTarget:self action:@selector(prohibitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:prohibitButton];
        
        
        [self.contentView addSubview:deviceNameLabel];
        [self.contentView addSubview:loginTimeLabel];
        
        CGFloat bottomLineH = 1;
        bottomLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kProtectionCellHeight-1, screenWidth, bottomLineH)];
        bottomLineLabel.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.7];
        [self.contentView addSubview:bottomLineLabel];
        
        
    }
    return self;
}
//修改按钮被点击，触发。
-(void)modifyButtonClick:(UIButton *)button{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
//禁止按钮被点击，触发
-(void)prohibitButtonClick:(UIButton *)button{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

//重写set方法。当往cell中传入模型时，为label赋值
-(void)setProtectionModel:(ProtectionModel *)protectionModel{
    _protectionModel = protectionModel;
    deviceNameLabel.text = _protectionModel.device_name;
    loginTimeLabel.text = _protectionModel.login_time;
}

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
