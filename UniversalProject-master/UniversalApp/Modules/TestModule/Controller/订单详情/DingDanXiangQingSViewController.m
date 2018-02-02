//
//  DingDanXiangQingSViewController.m
//  YiShopkeeper
//
//  Created by  apple on 2017/12/6.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "DingDanXiangQingSViewController.h"
#import "darendingdanxiangqingModel.h"
@interface DingDanXiangQingSViewController ()

@end

@implementation DingDanXiangQingSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"订单详情";
    [self httpRequest];
}

- (void)httpRequest
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/MyOrder/mySelfOrderDetailInfo",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(_myOrderId),@"myOrderId",@(12.1),@"x",@(13.1),@"y", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        NSDictionary *resultDic = [responseObj objectForKeyWithNullDetection:@"data"];
        if (result == 1) {
           darendingdanxiangqingModel *Model = [darendingdanxiangqingModel creatRankingTotalModelWith:resultDic];
            [self refreshView:Model];
        }else
        {
            
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        
    }];
}

- (void)refreshView:(darendingdanxiangqingModel *)model
{
    [self liuchengImagejindu:model.orderState];
    
}

- (void)liuchengImagejindu:(NSString *)str
{
    if ([str isEqualToString:@"1"]) {
        [self.liuchengImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0;
    }else if ([str isEqualToString:@"2"])
    {
       [self.liuchengImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.1428;
    }else if ([str isEqualToString:@"3"])
    {
        [self.liuchengImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        
        self.jinduProgressView.progress = 0.2857;

    }else if ([str isEqualToString:@"4"])
    {
        [self.liuchengImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.4285;


    }else if ([str isEqualToString:@"5"])
    {
        [self.liuchengImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView5 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.5714;


    }else if ([str isEqualToString:@"6"])
    {
        [self.liuchengImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView5 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView6 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.7142;


    }else if ([str isEqualToString:@"7"])
    {
        [self.liuchengImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView5 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView6 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView7 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.8571;


    }else if ([str isEqualToString:@"8"])
    {
        [self.liuchengImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView5 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView6 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView7 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.liuchengImageView8 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 1;

    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
