//
//  xiaoximokuaiTwoTableViewCell.h
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xiaoximokuaiTwoTableViewCell : UITableViewCell

- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath dataArray:(NSMutableArray *)data;
@property (strong, nonatomic) NSString *BtnZT;
@property (strong, nonatomic) IBOutlet UILabel *biaotikebianLabel;
@property (strong, nonatomic) IBOutlet UILabel *shijianTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *jiafangmingchengLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongzhongLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongzuoshijianLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongdanbianhaoLabel;
@property (strong, nonatomic) IBOutlet UILabel *tishiyuLabel;
@property (strong, nonatomic) IBOutlet UIButton *anniuSButton;



@end
