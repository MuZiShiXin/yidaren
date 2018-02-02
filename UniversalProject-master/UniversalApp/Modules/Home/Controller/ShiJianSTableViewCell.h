//
//  ShiJianSTableViewCell.h
//  YiTalentShow
//
//  Created by  apple on 2017/12/11.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface ShiJianSTableViewCell : UITableViewCell
@property (nonatomic,strong) UINavigationController *nava;
@property (strong, nonatomic) IBOutlet UIImageView *touxiangImageView;
@property (strong, nonatomic) IBOutlet UILabel *biaotiLabel;
@property (strong, nonatomic) IBOutlet UILabel *chengdanLabel;
@property (strong, nonatomic) IBOutlet UILabel *fenshuLabel;

@property (strong, nonatomic) IBOutlet UIImageView *XingXingImageView1;

@property (strong, nonatomic) IBOutlet UIImageView *XingXingImageView2;

@property (strong, nonatomic) IBOutlet UIImageView *XingXingImageView3;

@property (strong, nonatomic) IBOutlet UIImageView *XingXingImageView4;

@property (strong, nonatomic) IBOutlet UIImageView *XingXingImageView5;

@property (strong, nonatomic) IBOutlet UILabel *gongzuoshijianLabel;

@property (strong, nonatomic) IBOutlet UILabel *gongzuoshichangLabel;

@property (strong, nonatomic) IBOutlet UILabel *gongzhongLabel;

@property (strong, nonatomic) IBOutlet UILabel *xuyaorenrenshuLabel;

@property (strong, nonatomic) IBOutlet UILabel *shengyuLabel;

@property (strong, nonatomic) IBOutlet UILabel *juliLabel;

@property (strong, nonatomic) IBOutlet UILabel *gongzuodidianLabel;

@property (strong, nonatomic) IBOutlet UILabel *gongqianLabel;

@property (strong, nonatomic) IBOutlet UILabel *xinzidanweiLabel;


- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath Model:(HomeModel *)dic;


@end
