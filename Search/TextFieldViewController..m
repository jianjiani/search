//
//  SearchTableViewController.m
//  Search
//
//  Created by 孙英建 on 2017/4/26.
//  Copyright © 2017年 孙英建. All rights reserved.
//

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#import "SearchViewController.h"

@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource>

// 全部的数据源数组
@property (strong, nonatomic) NSArray *dataArr;
// 保存搜索出来的数据，如果未搜索则保存全部数据
@property (strong, nonatomic) NSMutableArray *resultArrM;

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UITextField *searchField;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultArrM = [NSMutableArray arrayWithArray:self.dataArr];
    [self configureUI];
}

- (void)configureUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.searchField.frame = CGRectMake(10, 74, ScreenWidth-20, 30);
    [self.view addSubview:self.searchField];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchField.frame)+10, ScreenWidth, self.view.frame.size.height-CGRectGetMaxY(self.searchField.frame)-10) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.resultArrM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.resultArrM[indexPath.row];
    
    return cell;
}

- (void)searchFieldEditingChanged:(UITextField *)searchField{
    if (searchField.text.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",searchField.text];
        self.resultArrM = [NSMutableArray arrayWithArray:[self.dataArr filteredArrayUsingPredicate:predicate]];
    }else {
        self.resultArrM = [NSMutableArray arrayWithArray:self.dataArr];
    }
    [self.tableView reloadData];
}


#pragma mark - 懒加载

- (UITextField *)searchField{
    if (!_searchField) {
        _searchField = [[UITextField alloc]init];
        _searchField.borderStyle = UITextBorderStyleNone;
        _searchField.returnKeyType = UIReturnKeySearch;
        _searchField.clearButtonMode = UITextFieldViewModeAlways;
        _searchField.placeholder = @"请输入要搜索的文字";
        _searchField.layer.cornerRadius = 8;
        _searchField.clipsToBounds = YES;
        _searchField.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:241/255.0 alpha:1];
        [_searchField addTarget:self action:@selector(searchFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _searchField;
}

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"小白1",@"小白2",@"小白3",@"小白4",@"小白5",@"小黑1",@"小黑2",@"小黑3",@"小黑4",@"小黑5",@"小黄1",@"小黄2",@"小黄3",@"小黄4",@"小黄5",@"小红1",@"小红2",@"小红3",@"小红4",@"小红5",@"大白1",@"大白2",@"大白3",@"大白4",@"大白5",@"大黑1",@"大黑2",@"大黑3",@"大黑4",@"大黑5",@"大黄1",@"大黄2",@"大黄3",@"大黄4",@"大黄5",@"大红1",@"大红2",@"大红3",@"大红4",@"大红5"];
    }
    return _dataArr;
}


@end

















