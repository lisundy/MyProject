//
//  SystemSettingsView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "SystemSettingsView.h"
#import "SystemSettingsModel.h"
#import "SystemSettingsCell.h"
@interface SystemSettingsView()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *sectionArray;    //用于存放SystemSettingsModel数组
@property(nonatomic,strong)NSArray *sectionArrayFromFile;   //读取文件后获得的数据
@end

@implementation SystemSettingsView


-(NSArray *)sectionArrayFromFile{       //从文件中，读取数据，懒加载
    if (_sectionArrayFromFile==nil) {
        _sectionArrayFromFile = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SystemSettingsProperty" ofType:@"plist"]];
    }
    return _sectionArrayFromFile;
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        //设置数据源和代理
        self.delegate = self;
        self.dataSource = self;
        //初始化用于存放model数组的数组
        self.sectionArray = [[NSMutableArray alloc] init];
        
//        @property(nonatomic,copy)NSString *cellTitle;                   //cell的title，为cell中左侧显示的文字
//        @property(nonatomic,copy)NSString *cellAvatar;                  //cell中的头像
//        @property(nonatomic,assign)SettingsCellStyle settingsCellStyle; //SettingsCell的样式选项
//        @property(nonatomic,copy)NSString *phoneNumber;                 //电话号码属性
//        @property(nonatomic,copy)NSString *secondLevelControllerString;       //2级控制器字符串
        NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserAuthData"];
        
        NSDictionary *firstCellDict = @{
                                       @"cellTitle":[userInfo objectForKey:@"nick"],
                                       @"cellAvatar":[userInfo objectForKey:@"curr_head"]
                                       };
        BOOL isSetFirstCell = NO;
        
        //遍历从文件中，解析出来的数据
        for (NSArray *array1 in self.sectionArrayFromFile) {
            NSMutableArray *marray = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in array1) {
                //字典转model
                
                if (isSetFirstCell == NO) {
                    if ([dict isEqualToDictionary:[array1 firstObject]]) {
                        SystemSettingsModel *model = [[SystemSettingsModel alloc] init];
                        [model setValuesForKeysWithDictionary:dict];
                        model.cellTitle = [firstCellDict objectForKey:@"cellTitle"];
                        model.cellAvatar = [firstCellDict objectForKey:@"cellAvatar"];
                        [marray addObject:model];
                        isSetFirstCell = YES;
                        continue;
                    }
                }
                
                SystemSettingsModel *model = [[SystemSettingsModel alloc] init];
                [model setValuesForKeysWithDictionary:dict];
                [marray addObject:model];
            }
            //遍历完一组数据，加入到sectionArray中，如有其它数据。继续for循环遍历
            [_sectionArray addObject:marray];
        }
    }
    return self;
}

-(void)setMobileNumber:(NSString *)numberString{
    SystemSettingsModel *model = [[self.sectionArray lastObject] lastObject];
    model.phoneNumber = numberString;
    [self reloadData];
}


#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_sectionArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"SystemSettingsCellID";
    
    SystemSettingsCell *cell = [self dequeueReusableCellWithIdentifier: cellID];
    
    if (cell==nil) {
         cell =[[SystemSettingsCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
 
    }
    //传入当前行的model进自定义cell
    cell.model = [[_sectionArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 1)
        return @"全局配置";
    return nil;
}

#pragma mark - 代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取选中行对应的模型数据
    SystemSettingsModel *model = [[_sectionArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    //获取选中行的cell，用于处理被选中事件
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    switch (model.settingsCellStyle) {
        case SettingsCellStyleCheckBoxSelected:{//点击checkbox一行，取消选中，进一步完成取消选中时需要的操作
            cell.accessoryType = UITableViewCellAccessoryNone;
            model.settingsCellStyle = SettingsCellStyleCheckBoxDeSelected;
        }
            break;
        case SettingsCellStyleCheckBoxDeSelected:{//展示选中按钮。进一步完成选中时需要的操作
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            model.settingsCellStyle = SettingsCellStyleCheckBoxSelected;
        }
            break;
        case SettingsCellStyleDetail:{//展开详细信息，触发操作
            [self sendControllerString2ViewController:indexPath];
            //_selectedIndexPath(indexPath);
        }
            break;
        case SettingsCellStyleAvatar:{//点击头像一行,触发操作
            //_selectedIndexPath(indexPath);
            [self sendControllerString2ViewController:indexPath];
        }
            break;
        default:
            break;
    }
    //发送2级控制器字符串到当前控制器
    
    
    [self deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - 自定义方法
#pragma mark 发送2级控制器字符串到当前控制器
-(void)sendControllerString2ViewController:(NSIndexPath *)indexPath{
    SystemSettingsModel *model = [[_sectionArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    NSString *controllerString = model.secondLevelControllerString;
    
    _selectedControllerStringBlock(controllerString);
    
}

@end
