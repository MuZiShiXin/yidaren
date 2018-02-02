//
//  dingdanduozhongzhuangtaiViewController.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "dingdanduozhongzhuangtaiViewController.h"
#import "darendingdanxiangqingModel.h"
#import "ZYInputAlertView.h"
@interface dingdanduozhongzhuangtaiViewController ()
{
    BOOL enableCustomMap;
}
@property (nonatomic ,strong) darendingdanxiangqingModel *Model;
@end

@implementation dingdanduozhongzhuangtaiViewController
+ (void)initialize {
    //设置自定义地图样式，会影响所有地图实例
    //注：必须在BMKMapView对象初始化之前调用
    NSString* path = [[NSBundle mainBundle] pathForResource:@"custom_config_清新蓝" ofType:@""];
    [BMKMapView customMapStyle:path];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.Views5.hidden = YES;
    self.Views6.hidden = YES;
    [self httpRequest];
    [_mapView viewWillAppear];
    _mapView.delegate = self;
    [BMKMapView enableCustomMapStyle:enableCustomMap];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [BMKMapView enableCustomMapStyle:NO];//关闭个性化地图
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
    
}
- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"订单详情";
    
}

-(void)naviBtnClick:(UIButton *)btn{
    DLog(@"点击取消工作");
    
    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示框"message:@"确定要取消么？" preferredStyle:UIAlertControllerStyleAlert];
//    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/MyOrder/changeTheOrderState",kPRTURL];
//
//        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@(_myOrderId),@"myOrderId",@(self.Model.recruitInfoId),@"recruitInfoId",@(11),@"orderState",nil];
//
//        [BaseHttpTool POST:urlStr params:dic success:^(id  _Nullable responseObj) {
//            NSInteger result = [[responseObj valueForKey:@"result"] intValue];
//            NSDictionary *resultDic = [responseObj objectForKeyWithNullDetection:@"data"];
//            if (result == 1) {
//                [self.view showRightWithTitle:@"提交成功" autoCloseTime:2];
//            }else
//            {
//
//            }
//        } failure:^(NSError * _Nullable error) {
//            NSLog(@"loginError:%@",error);
//
//        }];
//    }]];
//
//    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//
//    }]];

    
    __weak typeof(self) weakSelf = self;
    ZYInputAlertView *alertView = [ZYInputAlertView alertView];
    alertView.placeholder = @"输入取消原因···";
    [alertView confirmBtnClickBlock:^(NSString *inputString) {
//        weakSelf.inputLabel.text = inputString;
        NSLog(@"%@",inputString);
        
        NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/MyOrder/changeTheOrderState",kPRTURL];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@(_myOrderId),@"myOrderId",@(weakSelf.Model.recruitInfoId),@"recruitInfoId",@(11),@"orderState",inputString,@"discription",nil];
        [BaseHttpTool POST:urlStr params:dic success:^(id  _Nullable responseObj) {
            NSInteger result = [[responseObj valueForKey:@"result"] intValue];
            NSDictionary *resultDic = [responseObj objectForKeyWithNullDetection:@"data"];
            if (result == 1) {
                [weakSelf.view showRightWithTitle:@"提交成功" autoCloseTime:2];
            }else if(result == 2){
                [weakSelf.view showInfoWithTitle:@"请勿重复提交" autoCloseTime:2];
            }
        } failure:^(NSError * _Nullable error) {
            NSLog(@"loginError:%@",error);
        }];
    }];
    [alertView show];
    
    
    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示框"message:@"确定要取消么？" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
//
//
//        NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/MyOrder/changeTheOrderState",kPRTURL];
//        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@(_myOrderId),@"myOrderId",@(self.Model.recruitInfoId),@"recruitInfoId",@(11),@"orderState",nil];
//        __weak typeof(self) weakSelf = self;
//        [BaseHttpTool POST:urlStr params:dic success:^(id  _Nullable responseObj) {
//            NSInteger result = [[responseObj valueForKey:@"result"] intValue];
//            NSDictionary *resultDic = [responseObj objectForKeyWithNullDetection:@"data"];
//            if (result == 1) {
//                [self.view showRightWithTitle:@"提交成功" autoCloseTime:2];
//            }else{
//
//            }
//        } failure:^(NSError * _Nullable error) {
//            NSLog(@"loginError:%@",error);
//
//        }];
//
//    }];
//
//    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
//        return;
//    }];
//    [alertController addAction: cancel];
//    [alertController addAction: ok];
//    [self presentViewController: alertController animated: YES completion: nil];
    
    
    
}


- (void)httpRequest
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/MyOrder/mySelfOrderDetailInfo",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(_myOrderId),@"myOrderId",@(12.1),@"x",@(13.1),@"y", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSLog(@"%@",responseObj);
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        NSDictionary *resultDic = [responseObj objectForKeyWithNullDetection:@"data"];
        if (result == 1) {
            self.Model = [darendingdanxiangqingModel creatRankingTotalModelWith:resultDic];
            [self refreshView:self.Model];
        }else
        {
            
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        
    }];
}

- (void)refreshView:(darendingdanxiangqingModel *)model
{
    
    [self.Views5 removeFromSuperview];
    [self.Views6 removeFromSuperview];
    self.HigthView.constant = 1305;
    [self liuchengImagejindu:model.orderState];
    [_touxiangImageView sd_setImageWithURL:[NSURL URLWithString:model.headPicAdd] placeholderImage:[UIImage imageNamed:@"yg_sy_nr_tp1"]];
    [_gongzuobiaotiLabel setText:model.workTotal];
    [_gongqianLabel setText:[NSString stringWithFormat:@"%.2f",model.pay]];
    [_danweisLabel setText:[NSString stringWithFormat:@"/%@",model.payUtil]];
    [_gongjiqianshuLabel setText:[NSString stringWithFormat:@"共计：%.2f元",model.payAll]];
    [_gongzuokaishishijianLabel setText: model.startTm];
    [_gongzuoshichangLabel setText:[NSString stringWithFormat:@"%ld小时",model.woekDuration]];
    [_gongzhongLabel setText:model.workType];
    [_xuyaorenshuLabel setText:[NSString stringWithFormat:@"%ld人",model.recruitNum]];
    [_shengyurenshuLabel setText:[NSString stringWithFormat:@"%ld人",model.lastPeoNum]];
    [_gongzuojuliLabel setText:[NSString stringWithFormat:@"%@m",model.distance]];
    [_teshuyaoqiuLabel setText:model.workDetail];
    [_gongzuoxiangxidizhiLabel setText:model.minuteAdd];
    [_gongdanbianhaoLabel setText:model.workOrderTab];
    [_dingdanbianhaoLabel setText:model.orderNum];
    [_baomingshijiansLabel setText:model.applyTm];
    [_jiafangquerenTimeLabel setText:model.owberTm];
    [_daodaTimeLabel setText:model.arrivalTm];
    [_wangongTimeLabel setText:model.completeTm];
    [_jiafangyanshouTimeLabelS setText:model.owberAccpetTm];
    if ([model.orderState isEqualToString:@"2"]) {
        [_zhuangtaoSButton setTitle:@"到达" forState:UIControlStateNormal];
    }else if ([model.orderState isEqualToString:@"3"])
    {
         [_zhuangtaoSButton setTitle:@"完工" forState:UIControlStateNormal];
    }else
    {
        [_zhuangtaoSButton removeFromSuperview];
        self.HigthView.constant = 1305-45;
    }
    if ([model.orderState isEqualToString:@"1"]||[model.orderState isEqualToString:@"2"]||[model.orderState isEqualToString:@"3"]) {
        [self addNavigationItemWithTitles
         :@[@"取消工作"] isLeft:NO target:self action:@selector(naviBtnClick:) tags:@[@1000]];
    }
    
    enableCustomMap = NO;
    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(15, _Views3.mj_h - 295, kScreenWidth-30, 285)];
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    [self.Views3 addSubview:_mapView];
    
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = model.y;
    coor.longitude = model.x;
    annotation.coordinate = coor;
    annotation.title = model.minuteAdd;
    [self.mapView addAnnotation:annotation];
    
    if (_mapView.zoomLevel > 10) {
        _mapView.zoomLevel = 20;
    }else if (_mapView.zoomLevel < 8){
        _mapView.zoomLevel = 8;
    }
    [self.mapView setCenterCoordinate:coor animated:YES];
    self.mapView.gesturesEnabled = NO;
    
}

- (void)liuchengImagejindu:(NSString *)str
{
    if ([str isEqualToString:@"1"]) {
        [self.dingdanzhuangtaiImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImage2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.1428;
    }else if ([str isEqualToString:@"2"])
    {
        [self.dingdanzhuangtaiImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImage3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.2857;
    }else if ([str isEqualToString:@"3"])
    {
        [self.dingdanzhuangtaiImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImage4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.4285;
        
    }else if ([str isEqualToString:@"4"])
    {
        
        [self.dingdanzhuangtaiImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView5 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImage5 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.5714;
        
        
    }else if ([str isEqualToString:@"5"])
    {
        [self.dingdanzhuangtaiImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView5 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView6 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImage6 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.7142;
        
    }else if ([str isEqualToString:@"6"])
    {
        
        [self.dingdanzhuangtaiImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView5 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView6 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView7 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImage7 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.8571;
        
    }else if ([str isEqualToString:@"8"])
    {
        [self.dingdanzhuangtaiImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView4 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView5 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView6 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView7 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView8 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImage8 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 1;
        
    }else if ([str isEqualToString:@"13"])
    {
        [self.dingdanzhuangtaiImageView1 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView2 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImageView3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb1"]];
        [self.dingdanzhuangtaiImage3 setImage:[UIImage imageNamed:@"yg_dd_qxxq_nr_tb2"]];
        self.jinduProgressView.progress = 0.2857;
    }
}

- (IBAction)tijiaoButton {
    _zhuangtaoSButton.userInteractionEnabled = NO;
    NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/MyOrder/changeTheOrderState",kPRTURL];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(_myOrderId),@"myOrderId",@(self.Model.recruitInfoId),@"recruitInfoId",[self.Model.orderState isEqualToString:@"2"]? @(13):@(4),@"orderState",nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        if (result == 1) {
            [self.view showRightWithTitle:@"提交成功" autoCloseTime:2];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"TalentShowDetailsViewController" object:nil];
            _zhuangtaoSButton.userInteractionEnabled = YES;
            _zhuangtaoSButton.alpha = 4.0;
        }else if (result == 2){
            _zhuangtaoSButton.userInteractionEnabled = YES;
            [self.view showInfoWithTitle:@"请勿重复提交" autoCloseTime:2];

        }else
        {
            _zhuangtaoSButton.userInteractionEnabled = YES;
            [self.view showErrorWithTitle:@"提交失败" autoCloseTime:2];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        _zhuangtaoSButton.userInteractionEnabled = YES;
    }];
}







- (void)changeMapAction:(UISegmentedControl *)segment {
    /*
     *注：必须在BMKMapView对象初始化之前设置自定义地图样式，设置后会影响所有地图实例
     *设置方法：+ (void)customMapStyle:(NSString*) customMapStyleJsonFilePath;
     */
    enableCustomMap = segment.selectedSegmentIndex == 1;
    //打开/关闭个性化地图
    [BMKMapView enableCustomMapStyle:enableCustomMap];
}

#pragma mark - BMKMapViewDelegate

- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"BMKMapView控件初始化完成" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    //    [alert show];
    //    alert = nil;
}

- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate {
    NSLog(@"map view: click blank");
}

- (void)mapview:(BMKMapView *)mapView onDoubleClick:(CLLocationCoordinate2D)coordinate {
    NSLog(@"map view: double click");
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
