//
//  xitongxiaoxitongzhiTableViewCell.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "xitongxiaoxitongzhiTableViewCell.h"

@implementation xitongxiaoxitongzhiTableViewCell

- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath MasseaModelData:(MasseaModel *)Model;
{
    _xitongxiaoxibiaotiLabel.text = Model.msgTotal;
    _xitongxiaoxiTimeLabel.text = Model.seetime;
    _xitongxiaoxishuomingLabel.text = Model.msgContent;
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
