//
//  xiaoximokuaiTableViewCell.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "xiaoximokuaiTableViewCell.h"

@implementation xiaoximokuaiTableViewCell
- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath MasseaModelData:(MasseaModel *)Model
{
    if ([_BiaotiZT isEqualToString:@"甲方已确认"]) {
        [_biaotikebianLabel setText: @"甲方已确认"];
    }else if ([_BiaotiZT isEqualToString:@"消息提醒"])
    {
        [_biaotikebianLabel setText: @"消息提醒"];
    }
    self.biaotikebianLabel.text = Model.msgTotal;
    self.shijianTimeLabel.text = Model.seetime;
    self.jiafangmingchengLabel.text = Model.userName;
    self.gongzhongLabel.text = Model.workType;
    self.gongzuoshijianLabel.text = Model.woekDuration;
    self.gongdanbianhaoLabel.text = Model.workOrderTab;
    self.tishiyuLabel.text = Model.msgContent;
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
