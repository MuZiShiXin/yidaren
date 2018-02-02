//
//  qiyeyonggongliuyanSTableViewCell.h
//  UniversalApp
//
//  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasseaModel.h"
@interface qiyeyonggongliuyanSTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *zhangguiName;

@property (strong, nonatomic) IBOutlet UILabel *lookTime;

@property (strong, nonatomic) IBOutlet UILabel *nierong;

- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath MasseaModelData:(MasseaModel *)Model;
@end
