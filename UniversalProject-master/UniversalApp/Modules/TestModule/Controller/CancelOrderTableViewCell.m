//
//  CancelOrderTableViewCell.m
//  YiShopkeeper
//
//  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "CancelOrderTableViewCell.h"
#import "PingjiaSViewController.h"

@interface CancelOrderTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *touxiang;
@property (strong, nonatomic) IBOutlet UILabel *gongdanbiaoti;
@property (strong, nonatomic) IBOutlet UILabel *fabushijian;
@property (strong, nonatomic) IBOutlet UILabel *gongqian;
@property (strong, nonatomic) IBOutlet UILabel *jiagedanwei;

@property (strong, nonatomic) IBOutlet UILabel *shijianbiaoti;
@property (strong, nonatomic) IBOutlet UILabel *kaigongshijian;
@property (strong, nonatomic) IBOutlet UILabel *gongzuoshijian;
@property (strong, nonatomic) IBOutlet UILabel *zhiwei;
@property (strong, nonatomic) IBOutlet UILabel *gongzuodidianbiaoti;
@property (strong, nonatomic) IBOutlet UILabel *gongzuodidian;

@property (strong, nonatomic) MyDingDangModel *model;

@end


@implementation CancelOrderTableViewCell



- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath MyDingDangModel:(MyDingDangModel *)Model
{
    self.model = Model;
//    [_touxiang sd_setImageWithURL:[NSURL URLWithString:Model.headPicAdd] placeholderImage:[UIImage imageNamed:@"yg_sy_nr_tp1"]];
    [_touxiang sd_setImageWithURL:[NSURL URLWithString:Model.headPicAdd] placeholderImage:[UIImage imageNamed:@"yg_sy_nr_tp3"]];
    [_gongdanbiaoti setText:Model.workTotal];
    [_fabushijian setText:[NSString stringWithFormat:@"发布时间：%@", Model.issueTm]];
    [_gongqian setText:[NSString stringWithFormat:@"%.2f",Model.pay]];
    [_jiagedanwei setText: Model.payUnit];
    [_kaigongshijian setText:Model.startTm];
    [_gongzuoshijian setText:[NSString stringWithFormat:@"%ld小时",Model.woekDuration]];
    [_zhiwei setText:Model.workType];
    [_gongzuodidian setText:Model.minuteAdd];
    
    _yiquxiaoButton.layer.borderColor = [[UIColor hx_colorWithHexRGBAString:@"999999"] CGColor];
    //设置边框宽度
    _yiquxiaoButton.layer.borderWidth = 0.50f;
    //给按钮设置角的弧度
    _yiquxiaoButton.layer.cornerRadius = 10.0f;
    //设置背景颜色
    _yiquxiaoButton.layer.masksToBounds = NO;
    [self.yiquxiaoButton setTitle:[NSString stringWithFormat:@"%@",Model.orderState]  forState:UIControlStateNormal];
    if ([Model.orderState isEqualToString:@"待完工"]||[Model.orderState isEqualToString:@"待到达"]||[Model.orderState isEqualToString:@"待评价"]){
        _yiquxiaoButton.userInteractionEnabled = YES;
        _yiquxiaoButton.layer.borderColor = [[UIColor hx_colorWithHexRGBAString:@"27b8f3"] CGColor];
        [_yiquxiaoButton setTitleColor:[UIColor hx_colorWithHexRGBAString:kBlueColor] forState:UIControlStateNormal];
    }
    
}

- (void)dealloc
{
    self.touxiang = nil;
    self.gongdanbiaoti = nil;
    self.fabushijian = nil;
    self.gongqian = nil;
    self.jiagedanwei = nil;
    self.yiquxiaoButton = nil;
    self.shijianbiaoti = nil;
    self.kaigongshijian = nil;
    self.gongzuoshijian = nil;
    self.gongzuodidianbiaoti = nil;
    self.gongzuodidian = nil;
}


- (IBAction)daipingjiaButton:(UIButton *)Btn {
    if ([Btn.titleLabel.text isEqualToString:@"待评价"]) {
        PingjiaSViewController *PingjiaSVC = [[PingjiaSViewController alloc]init];
        PingjiaSVC.dingDanId = self.model.myOrderId;
        PingjiaSVC.gongDanId = self.model.recruitInfoId;
        [self.Navi pushViewController:PingjiaSVC animated:YES];
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
