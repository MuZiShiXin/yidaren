//
//  PersonListViewController.m
//  MiAiApp
//
//  Created by  apple on 2017/7/14.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "PersonListViewController.h"

#define itemWidthHeight ((kScreenWidth-30)/2)

@interface PersonListViewController ()

@end

@implementation PersonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isShowLiftBack = NO;//每个根视图需要设置该属性为NO，否则会出现导航栏异常
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
