//
//  xiaoximokuaiTwoTableViewCell.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "xiaoximokuaiTwoTableViewCell.h"

@implementation xiaoximokuaiTwoTableViewCell

- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath dataArray:(NSMutableArray *)data
{
    _anniuSButton.layer.cornerRadius = 4.0f;
    if ([_BtnZT isEqualToString:@"确认提醒"]) {
        [_biaotikebianLabel setText:@"确认提醒"];
        [_anniuSButton setTitle:@"请前往" forState:UIControlStateNormal];
    }else if ([_BtnZT isEqualToString:@"验收完成"])
    {
        [_biaotikebianLabel setText:@"验收完成"];
        [_anniuSButton setTitle:@"请前往" forState:UIControlStateNormal];
    }else if ([_BtnZT isEqualToString:@"拒绝提醒"])
    {
        [_biaotikebianLabel setText:@"拒绝提醒"];
        [_anniuSButton setTitle:@"查看详情" forState:UIControlStateNormal];
    }
}

- (IBAction)anniusBtn {
    DLog(@"请前往");
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
