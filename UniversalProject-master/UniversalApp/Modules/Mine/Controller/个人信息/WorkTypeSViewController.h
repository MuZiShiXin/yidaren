//
//  WorkTypeSViewController.h
//  YiShopkeeper
//
//  Created by  apple on 2018/1/17.
//  Copyright © 2018年 程序员. All rights reserved.
//

#import "RootViewController.h"
typedef void (^WorkTypeBlock)(NSString *);

@interface WorkTypeSViewController : RootViewController
@property (nonatomic ,strong) NSArray *WorkTypeDate;
@property (nonatomic ,strong) WorkTypeBlock block;

@end
