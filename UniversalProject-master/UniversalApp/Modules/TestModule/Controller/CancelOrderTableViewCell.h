//
//  CancelOrderTableViewCell.h
//  YiShopkeeper
//
//  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDingDangModel.h"
@interface CancelOrderTableViewCell : UITableViewCell
- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath MyDingDangModel:(MyDingDangModel *)Model;
@property (nonatomic ,strong)UINavigationController *Navi;
@property (strong, nonatomic) IBOutlet UIButton *yiquxiaoButton;
@end
