//
//  SystemSettingsModel.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SettingsCellStyle){
    SettingsCellStyleAvatar = 0,                //该行为头像行
    SettingsCellStyleCheckBoxSelected,          //选中
    SettingsCellStyleCheckBoxDeSelected,        //取消选中
    SettingsCellStyleDetail,                    //cell中显示（详情箭头“>”）
    SettingsCellStylePhoneNumber                //cell右侧显示一个subtextLabel
};

@interface SystemSettingsModel : NSObject

@property(nonatomic,copy)NSString *cellTitle;                   //cell的title，为cell中左侧显示的文字
@property(nonatomic,copy)NSString *cellAvatar;                  //cell中的头像
@property(nonatomic,assign)SettingsCellStyle settingsCellStyle; //SettingsCell的样式选项
@property(nonatomic,copy)NSString *phoneNumber;                 //电话号码属性
@property(nonatomic,copy)NSString *secondLevelControllerString;       //2级控制器字符串
@end
