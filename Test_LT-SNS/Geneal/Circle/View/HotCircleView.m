//
//  HotCircleView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HotCircleView.h"
#import "CircleModel.h"
#import "CircleCell.h"
#import "MJRefresh.h"

@interface HotCircleView()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,copy)RefreshBlock headerRefreshBlock;
@property(nonatomic,copy)RefreshBlock footerRefreshBlock;

@property(nonatomic,copy)NSMutableArray *circleModelsArray;

@property(nonatomic,assign)BOOL isMore;

@end

@implementation HotCircleView

-(void)setCircleModels:(NSMutableArray *)circleModels{
    _circleModels = circleModels;
    _circleModelsArray = [circleModels mutableCopy];
    [self.tableView reloadData];
}

-(id)initWithFrame:(CGRect)frame andHeaderRefreshBlock:(RefreshBlock)headerRefreshBlock FooterRefreshBlock:(RefreshBlock)footerRefreshBlock{
    self = [self initWithFrame:frame];
    if (self) {
        self.headerRefreshBlock = headerRefreshBlock;
        self.footerRefreshBlock = footerRefreshBlock;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), 44)];
        _searchBar.delegate = self;
        [self addSubview:_searchBar];
        
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_searchBar.frame), CGRectGetWidth(frame), CGRectGetHeight(frame)-CGRectGetHeight(_searchBar.frame)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        __weak __typeof(&*self)weakSelf = self;
        [_tableView addLegendFooterWithRefreshingBlock:^{
            weakSelf.footerRefreshBlock();
        }];
        [self addSubview:_tableView];
        
    }
    return self;
}

-(void)endRefreshing{
    [self.tableView.header endRefreshing];
    [self.tableView.footer endRefreshing];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self hideKeyboard];
}

//隐藏键盘
-(void)hideKeyboard{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}


#pragma mark - tableView
#pragma mark 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _circleModelsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"hotCircleCell";
    CircleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[CircleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.circleModel = [_circleModelsArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark 代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHotCircleViewDidSelectedRow object:nil userInfo:@{@"indexPath":indexPath}];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - searchBar
#pragma mark 代理方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    NSString *format = [NSString stringWithFormat:@"circleName LIKE[cd] '*%@*'",searchText];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:format];
    NSArray *array = [_circleModels filteredArrayUsingPredicate:predicate];
    
    _circleModelsArray = [array mutableCopy];
    [self.tableView reloadData];
}

@end
