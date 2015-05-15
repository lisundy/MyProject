//
//  HotPeopleView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/23.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HotPeopleView.h"
#import "HotPeopleModel.h"
#import "HotPeopleCell.h"
#import "MJRefresh.h"
@interface HotPeopleView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UISegmentedControl *segmentControl;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,copy)RefreshBlock headerRefreshBlock;
@property(nonatomic,copy)RefreshBlock footerRefreshBlock;

@end

@implementation HotPeopleView

-(id)initWithFrame:(CGRect)frame andHeaderRefreshBlock:(RefreshBlock)headerRefreshBlock FooterRefreshBlock:(RefreshBlock)footerRefreshBlock{
    self = [self initWithFrame:frame];
    if (self) {
        self.headerRefreshBlock = headerRefreshBlock;
        self.footerRefreshBlock = footerRefreshBlock;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat viewWidth = CGRectGetWidth(frame);
        CGFloat viewHeight = CGRectGetHeight(frame);
        
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, viewWidth, 44)];
        [self addSubview:_searchBar];
        
        _segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"全部",@"男",@"女"]];
        CGRect segmentFrame = _segmentControl.frame;
        segmentFrame.origin = CGPointMake(CGRectGetMaxX(frame)-CGRectGetWidth(segmentFrame)-10, CGRectGetMaxY(_searchBar.frame));
        _segmentControl.frame = segmentFrame;
        _segmentControl.selectedSegmentIndex = 0;
        [_segmentControl addTarget:self action:@selector(segmentValueChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_segmentControl];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_segmentControl.frame), viewWidth, viewHeight-CGRectGetHeight(_searchBar.frame)-CGRectGetHeight(_segmentControl.frame)) style:UITableViewStylePlain];
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


-(void)setHotPeopleModels:(NSArray *)hotPeopleModels{
    _hotPeopleModels = hotPeopleModels;
    [_tableView reloadData];
}

-(void)endRefresh{
    [self.tableView.header endRefreshing];
    [self.tableView.footer endRefreshing];
}

-(void)segmentValueChange:(UISegmentedControl *)segmentedControl{
    //具体功能先不显示，先隐藏键盘
    [self hideKeyboard];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHotPeopleViewSegmentControlValueChange object:nil userInfo:@{@"selectedIndex":@(segmentedControl.selectedSegmentIndex)}];
    
}

#pragma mark - 隐藏键盘
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
    
    return _hotPeopleModels.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"hotPeopleCellId";
    
    HotPeopleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[HotPeopleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.hotPeopleModel = [_hotPeopleModels objectAtIndex:indexPath.row];
    
    return cell;

}
#pragma mark 代理方法

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kHotPeopleCellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *homeId = [[self.hotPeopleModels objectAtIndex:indexPath.row] valueForKey:@"homeId"];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:kNotificationHotPeopleCellDidSelected object:nil userInfo:@{@"homeId":homeId}];
}

@end
