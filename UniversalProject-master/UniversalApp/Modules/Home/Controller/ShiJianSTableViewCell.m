//
//  ShiJianSTableViewCell.m
//  YiTalentShow
//
//  Created by  apple on 2017/12/11.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "ShiJianSTableViewCell.h"
#import "GongDanXiangQingSViewController.h"
@implementation ShiJianSTableViewCell

-(void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath Model:(HomeModel *)dic
{
    [_touxiangImageView sd_setImageWithURL:[NSURL URLWithString:dic.headPicAdd] placeholderImage:[UIImage imageNamed:@"yg_sy_nr_tp1"]];
    [_biaotiLabel setText:dic.workTotal];
    [_chengdanLabel setText:[NSString stringWithFormat:@"%ld",dic.sussOrderNumber]];
    [_fenshuLabel setText:[NSString stringWithFormat:@"%ld",dic.evaluateCore]];
    [self xingxing:dic.evaluateCorexx];
    [_gongzuoshijianLabel setText:dic.startTm];
    [_gongzuoshichangLabel setText:[NSString stringWithFormat:@"%ld小时",dic.woekDuration]];
    [_gongzhongLabel setText:dic.workType];
    [_xuyaorenrenshuLabel setText:[NSString stringWithFormat:@"%ld人 剩余 ",dic.recruitNum]];
    [_shengyuLabel setText:[NSString stringWithFormat:@"%ld人",dic.lastPeoNum]];
    [_juliLabel setText:[NSString stringWithFormat:@"%.f m",dic.distance]];
    [_gongzuodidianLabel setText:dic.minuteAdd];
    [_gongqianLabel setText:[NSString stringWithFormat:@"%.2f",dic.pay]];
    [_xinzidanweiLabel setText:dic.payUnit];
    
}





- (void)xingxing:(double)douNumber
{
    //ygdr_sy_nr_tb2 半星
    //yg_sy_gdpj_nr_tb2 全星
    //yg_sy_gdpj_nr_tb3 没星
    if ((douNumber <= 0.5 && douNumber > 0.0) || (douNumber <= 1.5 && douNumber > 1.0) || (douNumber <= 2.5 && douNumber > 2.0) || (douNumber <= 3.5 && douNumber > 3.0) || (douNumber <= 4.5 && douNumber > 4.0)){
        if ((douNumber <= 0.5 && douNumber > 0.0)) {
            [_XingXingImageView1 setImage:[UIImage imageNamed:banxing]];
            
        }else if ((douNumber <= 1.5 && douNumber > 1.0))
        {
            [_XingXingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView2 setImage:[UIImage imageNamed:banxing]];
        }else if ((douNumber <= 2.5 && douNumber > 2.0))
        {
            [_XingXingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView2 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView3 setImage:[UIImage imageNamed:banxing]];
        }else if ((douNumber <= 3.5 && douNumber > 3.0))
        {
            [_XingXingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView2 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView3 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView4 setImage:[UIImage imageNamed:banxing]];
        }else if ((douNumber <= 4.5 && douNumber > 4.0))
        {
            [_XingXingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView2 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView3 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView4 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView5 setImage:[UIImage imageNamed:banxing]];
        }
        
    }else if ((douNumber <= 1.0 && douNumber > 0.5) || (douNumber <= 2.0 && douNumber > 1.5) || (douNumber <= 3.0 && douNumber > 2.5) || (douNumber <= 4.0 && douNumber > 3.5) || (douNumber <= 5.0 && douNumber > 4.5)){
        if ((douNumber <= 1.0 && douNumber > 0.5)) {
            [_XingXingImageView1 setImage:[UIImage imageNamed:quanxing]];
        }else if ((douNumber <= 2.0 && douNumber > 1.5))
        {
            [_XingXingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_XingXingImageView2 setImage:[UIImage imageNamed:quanxing]];
        }else if ((douNumber <= 3.0 && douNumber > 2.5))
        {
                [_XingXingImageView1 setImage:[UIImage imageNamed:quanxing]];
                [_XingXingImageView2 setImage:[UIImage imageNamed:quanxing]];
                [_XingXingImageView3 setImage:[UIImage imageNamed:quanxing]];
        }else if ((douNumber <= 4.0 && douNumber > 3.5))
        {
                [_XingXingImageView1 setImage:[UIImage imageNamed:quanxing]];
                [_XingXingImageView2 setImage:[UIImage imageNamed:quanxing]];
                [_XingXingImageView3 setImage:[UIImage imageNamed:quanxing]];
                [_XingXingImageView4 setImage:[UIImage imageNamed:quanxing]];
        }else if ((douNumber >= 5.0 && douNumber > 4.5))
        {
                [_XingXingImageView1 setImage:[UIImage imageNamed:quanxing]];
                [_XingXingImageView2 setImage:[UIImage imageNamed:quanxing]];
                [_XingXingImageView3 setImage:[UIImage imageNamed:quanxing]];
                [_XingXingImageView4 setImage:[UIImage imageNamed:quanxing]];
                [_XingXingImageView5 setImage:[UIImage imageNamed:quanxing]];
        }
        
    }

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
