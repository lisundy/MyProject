//
//  EditPersonalView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/20.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "EditPersonalView.h"
#import "HZAreaPickerView.h"

#define kBorder 10
#define kAvatarWH 70

typedef NS_ENUM(NSInteger, SexType){
    SexTypeFemale = 0,
    SexTypeMale = 1
};

@interface EditPersonalView ()<HZAreaPickerDelegate>

@property(nonatomic,strong)UITextField *nickNameField;
@property(nonatomic,strong)UIButton *sexButton;
@property(nonatomic,strong)HZAreaPickerView *pickerView;
@property(nonatomic,strong)UIButton *provinceButton;
@property(nonatomic,strong)UIButton *cityButton;
@property(nonatomic,strong)UITextField *xinqingField;
@property(nonatomic,strong)UIImageView *avatarImageView;
@end

@implementation EditPersonalView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置头部View，用来包裹头像ImageView，和编辑头像按钮
        UIView *headBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(kBorder, kBorder, CGRectGetWidth(frame)-2*kBorder, 100)];
        headBackgroundView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:headBackgroundView];
        //头像ImageView
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2*kBorder, CGRectGetHeight(headBackgroundView.frame)/2-kAvatarWH/2, kAvatarWH, kAvatarWH)];
        _avatarImageView.image = [UIImage imageNamed:@"head_icon_test"];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 10.0f;
        [headBackgroundView addSubview:_avatarImageView];
        
        //编辑头像按钮的宽高
        CGFloat editAvatarWidth = 108;
        CGFloat editAvatarHeight = 25;
        
        UIButton *editAvatarButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-4*kBorder-editAvatarWidth, CGRectGetHeight(headBackgroundView.frame)/2-editAvatarHeight/2, editAvatarWidth, editAvatarHeight)];
        editAvatarButton.layer.masksToBounds = YES;
        editAvatarButton.layer.cornerRadius = 10.0f;
        [editAvatarButton setBackgroundImage:[UIImage imageNamed:@"edit_image_183_70_108_25"] forState:UIControlStateNormal];
        [editAvatarButton addTarget:self action:@selector(modifyAvatar:) forControlEvents:UIControlEventTouchUpInside];
        [headBackgroundView addSubview:editAvatarButton];
        
        //下方View，用来包裹具体用户资料的各种View
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(kBorder, CGRectGetMaxY(headBackgroundView.frame)+kBorder, CGRectGetWidth(frame)-2*kBorder, 176)];
        contentView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
        [self addSubview:contentView];
        
        CGFloat labelWidth = 60;
        CGFloat labelHeight = 44;
        UILabel *nickLabel = [[UILabel alloc] initWithFrame:CGRectMake(kBorder, 0, labelWidth, labelHeight)];
        nickLabel.text = @"昵称";
        [contentView addSubview:nickLabel];
        _nickNameField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nickLabel.frame)+kBorder, 0, CGRectGetWidth(frame)-labelWidth-4*kBorder, labelHeight)];
        [_nickNameField addTarget:self action:@selector(textFieldEditBegin) forControlEvents:UIControlEventEditingDidBegin];
        [contentView addSubview:_nickNameField];
        
        UILabel *sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(kBorder, CGRectGetMaxY(nickLabel.frame), labelWidth, labelHeight)];
        sexLabel.text = @"性别";
        [contentView addSubview:sexLabel];
        _sexButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(_nickNameField.frame), CGRectGetMinY(sexLabel.frame), CGRectGetWidth(_nickNameField.frame), labelHeight)];
        [_sexButton setTitle:@"男" forState:UIControlStateNormal];
        _sexButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_sexButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sexButton addTarget:self action:@selector(sexButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:_sexButton];
        
        UILabel *locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(kBorder, CGRectGetMaxY(sexLabel.frame), labelWidth, labelHeight)];
        locationLabel.text = @"所在地";
        [contentView addSubview:locationLabel];
        
        CGFloat buttonWidth = 100;
        _provinceButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(_sexButton.frame), CGRectGetMinY(locationLabel.frame), buttonWidth, labelHeight)];
        _provinceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_provinceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_provinceButton addTarget:self action:@selector(openProvinceAndCityKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:_provinceButton];
        UILabel *provinceLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_provinceButton.frame), CGRectGetMinY(_provinceButton.frame), 20, labelHeight)];
        provinceLabel.text = @"省";
        [contentView addSubview:provinceLabel];
        
        _cityButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(provinceLabel.frame), CGRectGetMinY(provinceLabel.frame), buttonWidth, labelHeight)];
        _cityButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_cityButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cityButton addTarget:self action:@selector(openProvinceAndCityKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:_cityButton];
        UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_cityButton.frame), CGRectGetMinY(_cityButton.frame), 20, labelHeight)];
        cityLabel.text = @"市";
        [contentView addSubview:cityLabel];
        
        
        UILabel *xinqingLabel = [[UILabel alloc] initWithFrame:CGRectMake(kBorder, CGRectGetMaxY(locationLabel.frame), labelWidth, labelHeight)];
        xinqingLabel.text = @"心情";
        [contentView addSubview:xinqingLabel];
        
        
        _pickerView = [[HZAreaPickerView alloc] initWithStyle:HZAreaPickerWithStateAndCity delegate:self];
        
        _xinqingField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(_provinceButton.frame), CGRectGetMinY(xinqingLabel.frame), CGRectGetWidth(frame)-labelWidth-4*kBorder, labelHeight)];
        [_xinqingField addTarget:self action:@selector(textFieldEditBegin) forControlEvents:UIControlEventEditingDidBegin];
        [contentView addSubview:_xinqingField];
        
    }
    return self;
}

//当textField开始编辑时候，隐藏pickView
-(void)textFieldEditBegin{
    [_pickerView cancelPicker];
}

//pickView代理方法，触发时，改变2个按钮的名字
- (void)pickerDidChaneStatus:(HZAreaPickerView *)picker{
    //picker.locate
    HZLocation *location = picker.locate;
    [_provinceButton setTitle:location.state forState:UIControlStateNormal];
    [_cityButton setTitle:location.city forState:UIControlStateNormal];
}
//当province按钮和city按钮被点击时，先让textField的键盘隐藏，再显示pickView
-(void)openProvinceAndCityKeyboard{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [_pickerView showInView:self];
}
//触摸屏幕时，隐藏键盘，隐藏pickView
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [_pickerView cancelPicker];
}
//点击性别按钮
-(void)sexButtonClick:(UIButton *)button{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];   //隐藏键盘
    [_pickerView cancelPicker]; //隐藏pickView
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"请选择您的性别" delegate:self cancelButtonTitle:nil otherButtonTitles:@"女",@"男", nil];
    [alertView show];   //弹出alertView让用户选择性别
}

//alertView代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //NSLog(@"%ld",(long)buttonIndex);
    NSString *sexString = buttonIndex == SexTypeFemale?@"女":@"男";
    [_sexButton setTitle:sexString forState:UIControlStateNormal];  //选择性别后，为性别按钮更换title
}

//点击更改头像按钮，弹出actionSheet
-(void)modifyAvatar:(UIButton *)button{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"从相册选择" otherButtonTitles:nil, nil];
    [actionSheet showInView:self];
}


@end
