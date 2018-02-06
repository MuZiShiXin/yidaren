//
//  MyOrderTableViewCell.m
//  YiShopkeeper
//
//  Created by  apple on 2017/11/29.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "MyOrderTableViewCell.h"
#import "PingjiaSViewController.h"
#import "DingDanGuiJiSViewController.h"

@interface MyOrderTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *touxiang;
@property (strong, nonatomic) IBOutlet UILabel *gongdanbiaoti;
@property (strong, nonatomic) IBOutlet UILabel *fabushijian;
@property (strong, nonatomic) IBOutlet UILabel *gongqian;
@property (strong, nonatomic) IBOutlet UILabel *jiagedanwei;
@property (strong, nonatomic) IBOutlet UIButton *daipingjiaButton;
@property (strong, nonatomic) IBOutlet UILabel *shijianbiaoti;
@property (strong, nonatomic) IBOutlet UILabel *kaigongshijian;
@property (strong, nonatomic) IBOutlet UILabel *gongzuoshijian;
@property (strong, nonatomic) IBOutlet UILabel *zhiwei;
@property (strong, nonatomic) IBOutlet UILabel *gongzuodidianbiaoti;
@property (strong, nonatomic) IBOutlet UILabel *gongzuodidian;
@property (strong, nonatomic) IBOutlet UIButton *quxiaobaomingButton;

@end


@implementation MyOrderTableViewCell

- (void)initSubViewsWithIndexPath:(NSIndexPath *)indexPath MyDingDangModel:(MyDingDangModel *)Model
{
//    [_touxiang sd_setImageWithURL:[NSURL URLWithString:Model.headPicAdd] placeholderImage:[UIImage imageNamed:@"yg_sy_nr_tp1"]];
    self.DingDangModel = Model;
    [_touxiang sd_setImageWithURL:[NSURL URLWithString:Model.headPicAdd]];
    [_gongdanbiaoti setText:Model.workTotal];
    [_fabushijian setText:Model.issueTm];
    [_gongqian setText:[NSString stringWithFormat:@"%.2f",Model.pay]];
    [_jiagedanwei setText: Model.payUnit];
    [_gongzuoshijian setText:Model.startTm];
    [_gongzuodidian setText:Model.minuteAdd];
    
    _daipingjiaButton.layer.borderColor = [[UIColor hx_colorWithHexRGBAString:@"999999"] CGColor];
    //设置边框宽度
    _daipingjiaButton.layer.borderWidth = 0.50f;
    //给按钮设置角的弧度
    _daipingjiaButton.layer.cornerRadius = 10.0f;
    //设置背景颜色
    _daipingjiaButton.layer.masksToBounds = YES;
    
    if ([_ButtonNameStr isEqualToString:@"1"] ) {
        [_quxiaobaomingButton setTitle:@"取消订单" forState:UIControlStateNormal];
    }else
    {
        [_quxiaobaomingButton setTitle:@"订单轨迹" forState:UIControlStateNormal];
    }
    //给按钮设置角的弧度
    _quxiaobaomingButton.layer.cornerRadius = 4.0f;
    //设置背景颜色
    _quxiaobaomingButton.layer.masksToBounds = YES;
    
    
    
}


- (IBAction)daipingjiaBtnS {
    NSLog(@"待评价按钮");
    PingjiaSViewController *PingjiaSVC = [[PingjiaSViewController alloc]init];
    PingjiaSVC.dingDanId = self.DingDangModel.myOrderId;
    PingjiaSVC.gongDanId = self.DingDangModel.recruitInfoId;
    [self.Navi pushViewController:PingjiaSVC animated:YES];
}

- (IBAction)zhuangtaisButton:(UIButton *)sender {
    NSLog(@"%@",sender.titleLabel.text);
    if ([sender.titleLabel.text isEqualToString:@"取消订单"]) {
        NSLog(@"取消订单");
    }else if ([sender.titleLabel.text isEqualToString:@"订单轨迹"])
    {
        NSLog(@"订单轨迹");
        DingDanGuiJiSViewController *DingDanGuiJiSVC = [[DingDanGuiJiSViewController alloc]init];
        [self.Navi pushViewController:DingDanGuiJiSVC animated:YES];
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
