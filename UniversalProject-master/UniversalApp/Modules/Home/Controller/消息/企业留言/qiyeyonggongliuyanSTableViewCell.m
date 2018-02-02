//
//  qiyeyonggongliuyanSTableViewCell.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "qiyeyonggongliuyanSTableViewCell.h"

@implementation qiyeyonggongliuyanSTableViewCell
- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath MasseaModelData:(MasseaModel *)Model
{
    _zhangguiName.text = Model.userName;
    _lookTime.text = Model.seetime;
    _nierong.text = Model.msgContent;
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
