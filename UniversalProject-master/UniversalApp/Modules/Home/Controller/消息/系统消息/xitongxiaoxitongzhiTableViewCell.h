//
//  xitongxiaoxitongzhiTableViewCell.h
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasseaModel.h"
@interface xitongxiaoxitongzhiTableViewCell : UITableViewCell
- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath MasseaModelData:(MasseaModel *)Model;
@property (strong, nonatomic) IBOutlet UILabel *xitongxiaoxibiaotiLabel;
@property (strong, nonatomic) IBOutlet UILabel *xitongxiaoxiTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *xitongxiaoxishuomingLabel;

@end
