//
//  ResultViewController.m
//  Search
//
//  Created by 孙英建 on 2017/4/27.
//  Copyright © 2017年 孙英建. All rights reserved.
//

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#import "ResultViewController.h"

@interface ResultViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

- (void)configureUI{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.resultArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.textColor = [UIColor blackColor];
    // 将搜索的关键字变为红色
    NSString *title = self.resultArr[indexPath.row];
    if (self.keyWord.length > 0) {
        NSRange range = [title rangeOfString:self.keyWord];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:title];
        [str addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:range];
        cell.textLabel.attributedText = str;
    }else{
        cell.textLabel.text = title;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *str = self.resultArr[indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"result" message:str delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)setResultArr:(NSArray *)resultArr{
    _resultArr = resultArr;
    [self.tableView reloadData];
}

@end












