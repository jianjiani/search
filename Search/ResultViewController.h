//
//  ResultViewController.h
//  Search
//
//  Created by 孙英建 on 2017/4/27.
//  Copyright © 2017年 孙英建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController

// 搜索的结果数组
@property (strong, nonatomic) NSArray *resultArr;

// 搜索的关键字
@property (copy, nonatomic) NSString *keyWord;

@end
