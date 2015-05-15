//
//  MyIDListView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "MyIDListView.h"
#import "MyIDListModel.h"
#import "MyIDListCell.h"
@interface MyIDListView()<UITableViewDataSource,UITableViewDelegate>



@end

@implementation MyIDListView

//-(NSMutableArray *)myIDListModelsArray{
//    if (!_myIDListModelsArray) {
//        _myIDListModelsArray = [[NSMutableArray alloc] init];
//        
//        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MyIDListViewProperty" ofType:@"plist"]];
//        for (NSDictionary *dict in array) {
//            MyIDListModel *model = [[MyIDListModel alloc] init];
//            [model setValuesForKeysWithDictionary:dict];
//            [_myIDListModelsArray addObject:model];
//        }
//        
//        
//    }
//    return _myIDListModelsArray;
//}

-(void)setMyIDListModelsArray:(NSMutableArray *)myIDListModelsArray{
    _myIDListModelsArray = [myIDListModelsArray mutableCopy];
    [self reloadData];
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}
#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myIDListModelsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"MyIDListCell";
    
    MyIDListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MyIDListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.myIDModel = [self.myIDListModelsArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kMyIDListCellHeight;
}

@end
