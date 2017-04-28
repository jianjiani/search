//
//  ViewController.m
//  Search
//
//  Created by 孙英建 on 2017/4/26.
//  Copyright © 2017年 孙英建. All rights reserved.
//

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "TextFieldViewController.h"
#import "SearchControllerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

- (void)configureUI{
    UIButton *pushBtn1 = [[UIButton alloc]init];
    pushBtn1.center = self.view.center;
    pushBtn1.bounds = CGRectMake(0, 0, ScreenWidth, 30);
    [self.view addSubview:pushBtn1];
    [pushBtn1 setTitle:@"searchController搜索" forState:UIControlStateNormal];
    [pushBtn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [pushBtn1 addTarget:self action:@selector(pushBtn1Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *pushBtn2 = [[UIButton alloc]init];
    pushBtn2.frame = CGRectMake(CGRectGetMinX(pushBtn1.frame), CGRectGetMaxY(pushBtn1.frame)+10, CGRectGetWidth(pushBtn1.frame), CGRectGetHeight(pushBtn1.frame));
    [self.view addSubview:pushBtn2];
    [pushBtn2 setTitle:@"textField搜索" forState:UIControlStateNormal];
    [pushBtn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [pushBtn2 addTarget:self action:@selector(pushBtn2Action) forControlEvents:UIControlEventTouchUpInside];
}

// 使用UISearchController进行搜索
- (void)pushBtn1Action{
    SearchControllerViewController *searchVC = [[SearchControllerViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

// 使用textField进行搜索
- (void)pushBtn2Action{
    TextFieldViewController *textFieldSearchVC = [[TextFieldViewController alloc]init];
    [self.navigationController pushViewController:textFieldSearchVC animated:YES];
}


@end
