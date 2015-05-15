//
//  SystemSettingsCell.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "SystemSettingsCell.h"
#import "SystemSettingsModel.h"

@implementation SystemSettingsCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

//重写set方法，当传入模型时，更改数据
-(void)setModel:(SystemSettingsModel *)model{
    _model = model;
    self.textLabel.text = model.cellTitle;
    self.detailTextLabel.text = model.phoneNumber;
    
    switch (_model.settingsCellStyle) {
        case SettingsCellStyleAvatar:{
            self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.cellAvatar]]];
            self.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
        case SettingsCellStyleCheckBoxSelected:{
            self.accessoryType = UITableViewCellAccessoryCheckmark;
        }
            break;
        case SettingsCellStyleDetail:{
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        case SettingsCellStylePhoneNumber:{
            self.accessoryType = UITableViewCellAccessoryNone;
        }
            break;
        default:
            break;
    }
    
}



@end
