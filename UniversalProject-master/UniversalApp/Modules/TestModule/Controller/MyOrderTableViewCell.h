//
//  MyOrderTableViewCell.h
//  YiShopkeeper
//
//  Created by  apple on 2017/11/29.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDingDangModel.h"
@interface MyOrderTableViewCell : UITableViewCell
@property (nonatomic ,strong)UINavigationController *Navi;
@property (nonatomic ,strong)NSString *ButtonNameStr;
- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath MyDingDangModel:(MyDingDangModel *)Model;
@end
