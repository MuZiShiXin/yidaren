//
//  GongDanXiangQingSViewController.m
//  UniversalApp
//
//  Created by  apple on 2017/12/12.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "GongDanXiangQingSViewController.h"
#include "SDCycleScrollView.h"
#import "gongzuoxinxiModel.h"
#import "gerenxinxiViewController.h"
@interface GongDanXiangQingSViewController ()<SDCycleScrollViewDelegate>
{
    BOOL enableCustomMap;
}
@property (nonatomic, strong) gongzuoxinxiModel *model;
/** 轮播图 */
@property (nonatomic,strong) SDCycleScrollView *banner;
@end

@implementation GongDanXiangQingSViewController

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
    self.title = @"工单详情";
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)httpRequest
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/ExpertHomePage/expertHomeDetailInfo",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(self.recruitInfoId),@"recruitInfoId", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSLog(@"%@",responseObj);
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        NSDictionary *resultDic = [responseObj objectForKeyWithNullDetection:@"data"];
        if (result == 1) {
                self.model = [gongzuoxinxiModel creatRankingTotalModelWith:resultDic];
            [self gengxinView];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
    }];
}


- (void)gengxinView
{    
    [_darentouxiangImageView sd_setImageWithURL:[NSURL URLWithString:self.model.workEnvPicAddTotal] placeholderImage:[UIImage imageNamed:@"yg_sy_nr_tp3"]];
    
    [_gonzuobiaotiLabel setText:self.model.workTotal];
    [_chengdanshuLabel setText:[NSString stringWithFormat:@"%ld单",(long)self.model.sussOrderNumber]];
    [_pingfenLabel setText:[NSString stringWithFormat:@"%ld",(long)self.model.evaluateCore]];
    [self xingxing:self.model.evaluateCorexx];
    [_gongqianLabel setText:[NSString stringWithFormat:@"%.2f",self.model.pay]];
    [_danweiLabel setText:self.model.payUnit];
    [_fabushijianLabel setText:self.model.issueTm];
    [_gongzuoshijianLabel setText:self.model.startTm];
    [_gongzuoshichangLabel setText:[NSString stringWithFormat:@"%ld小时",(long)self.model.woekDuration]];
    [_gongzuozhiweiLabel setText: self.model.workType];
    [_xuyaorenshuLabel setText:[NSString stringWithFormat:@"%ld人",(long)self.model.recruitNum]];
    [_shengyurenshuLabel setText:[NSString stringWithFormat:@"%ld人",(long)self.model.lastPeoNum]];
    [_yibaorenshuLabel setText:[NSString stringWithFormat:@"%@ m",self.model.distance]];
    [_gongzuodidianLabel setText:self.model.minuteAdd];
    [_gongdanbianhaoLabel setText:self.model.workOrderTab];
    [_darenxiangxineirongLabel setText:self.model.workDetail];
    [_zhangguitouxiangImageView sd_setImageWithURL:[NSURL URLWithString:self.model.headPicAdd] placeholderImage:[UIImage imageNamed:@"yg_sy_nr_tp1"]];


    
    [_zhangguimingchengLanel setText:self.model.nick];
    [_zhangguichengdanshuLabel setText:[NSString stringWithFormat:@"%ld单",(long)self.model.sussOrderNumber]];
    [_zhangguipingfenLabel setText:[NSString stringWithFormat:@"%ld",(long)self.model.evaluateCore]];
    [_zhangguijianjieLabel setText:self.model.firmIntro];
    [_zhangguileixingLabel setText:self.model.clientType];
    [_ditugongzuodidianLabel setText:self.model.minuteAdd];
    
    
    NSMutableArray *ary = [NSMutableArray array];
    for (int i = 0; i<self.model.workEvnPic.count; i++) {
        NSString *str = [self.model.workEvnPic[i]objectForKeyWithNullUnKnown:@"workEnvPicAdd"];
        [ary addObject:str];
    }
    
    //设置顶部轮播器
    _banner = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(_gongzuozhaopianLabel.frame)+10, kScreenWidth-30, 180)];
    _banner.delegate = self;
    //设置分页位置
    _banner.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    //设置时间间隔
    _banner.autoScrollTimeInterval = 3.0;
    //设置当前分页圆点颜色
    _banner.currentPageDotColor = [UIColor whiteColor];
    //设置其它分页圆点颜色
    _banner.pageDotColor = [UIColor lightGrayColor];
    //设置动画样式
    _banner.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    _banner.localizationImageNamesGroup = ary;
    [_fourViews addSubview:_banner];
    
    enableCustomMap = NO;
    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(15, _workView.mj_h - 312, kScreenWidth-30, 302)];
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    [self.workView addSubview:_mapView];
    
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.longitude = self.model.x;
    coor.latitude = self.model.y ;
    annotation.coordinate = coor;
    annotation.title = self.model.minuteAdd;
    [self.mapView addAnnotation:annotation];
    
    if (_mapView.zoomLevel > 10) {
        _mapView.zoomLevel = 20;
    }else if (_mapView.zoomLevel < 8){
        _mapView.zoomLevel = 8;
    }
    [self.mapView setCenterCoordinate:coor animated:YES];
    self.mapView.gesturesEnabled = NO;
//    if (YES) {
//        [self addNavigationItemWithTitles
//         :@[@"取消报名"] isLeft:NO target:self action:@selector(naviBtnClick:) tags:@[@1000]];
//        [_woyaobaomingButton removeFromSuperview];
//    }
    
}



//-(void)naviBtnClick:(UIButton *)btn{
//    DLog(@"点击取消报名");
//}

- (IBAction)WoYaoBaoMingBtn {
    DLog(@"点击我要报名");
    
    _woyaobaomingButton.userInteractionEnabled = NO;
    if (userManager.curUserInfo.wanShanXinXi == 0) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                       message:@"请完善信息后报名 !"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  //响应事件
                                                                  NSLog(@"action = %@", action);
                                                              }];
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 NSLog(@"action = %@", action);
                                                                 
                                                                 gerenxinxiViewController *gerenxinxiVC = [[gerenxinxiViewController alloc]init];
                                                                 [self.navigationController pushViewController:gerenxinxiVC animated:YES];
                                                                 
                                                             }];
        
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else
    {
        NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/MyOrder/createOrder",kPRTURL];
        
        NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userInfoId", @(self.recruitInfoId),@"recruitInfoId",@(1),@"orderState", nil];
        
        [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
            NSInteger result = [[responseObj valueForKey:@"result"] intValue];
            if (result == 1) {
                [self.view showRightWithTitle:@"报名成功" autoCloseTime:2];
                _woyaobaomingButton.userInteractionEnabled = NO;
                [_woyaobaomingButton setTitle:@"报名成功" forState:UIControlStateNormal];
                _woyaobaomingButton.alpha = 0.4;
                if (_block != nil) {
                    _block(YES);
                }
            }else
            {
                _woyaobaomingButton.userInteractionEnabled = YES;
                [self.view showInfoWithTitle:@"请勿重复操作" autoCloseTime:2];
            }
        } failure:^(NSError * _Nullable error) {
            _woyaobaomingButton.userInteractionEnabled = YES;
            NSLog(@"loginError:%@",error);
        }];
    }  
}



- (void)xingxing:(double)douNumber
{
    //ygdr_sy_nr_tb2 半星
    //yg_sy_gdpj_nr_tb2 全星
    //yg_sy_gdpj_nr_tb3 没星
    if ((douNumber <= 0.5 && douNumber > 0.0) || (douNumber <= 1.5 && douNumber > 1.0) || (douNumber <= 2.5 && douNumber > 2.0) || (douNumber <= 3.5 && douNumber > 3.0) || (douNumber <= 4.5 && douNumber > 4.0)){
        if ((douNumber <= 0.5 && douNumber > 0.0)) {
            [_xingxingImageView1 setImage:[UIImage imageNamed:banxing]];
            [_zhangguixingxing1 setImage:[UIImage imageNamed:banxing]];

        }else if ((douNumber <= 1.5 && douNumber > 1.0))
        {
            [_xingxingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView2 setImage:[UIImage imageNamed:banxing]];
            [_zhangguixingxing1 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing2 setImage:[UIImage imageNamed:banxing]];

        }else if ((douNumber <= 2.5 && douNumber > 2.0))
        {
            [_xingxingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView2 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView3 setImage:[UIImage imageNamed:banxing]];
            [_zhangguixingxing1 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing2 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing3 setImage:[UIImage imageNamed:banxing]];

        }else if ((douNumber <= 3.5 && douNumber > 3.0))
        {
            [_xingxingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView2 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView3 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView4 setImage:[UIImage imageNamed:banxing]];
            [_zhangguixingxing1 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing2 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing3 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing4 setImage:[UIImage imageNamed:banxing]];

        }else if ((douNumber <= 4.5 && douNumber > 4.0))
        {
            [_xingxingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView2 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView3 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView4 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView5 setImage:[UIImage imageNamed:banxing]];
            [_zhangguixingxing1 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing2 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing3 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing4 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing5 setImage:[UIImage imageNamed:banxing]];

        }
        
    }else if ((douNumber <= 1.0 && douNumber > 0.5) || (douNumber <= 2.0 && douNumber > 1.5) || (douNumber <= 3.0 && douNumber > 2.5) || (douNumber <= 4.0 && douNumber > 3.5) || (douNumber <= 5.0 && douNumber > 4.5)){
        if ((douNumber <= 1.0 && douNumber > 0.5)) {
            [_xingxingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing1 setImage:[UIImage imageNamed:quanxing]];
        }else if ((douNumber <= 2.0 && douNumber > 1.5))
        {
            [_xingxingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView2 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing1 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing2 setImage:[UIImage imageNamed:quanxing]];
        }else if ((douNumber <= 3.0 && douNumber > 2.5))
        {
            [_xingxingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView2 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView3 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing1 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing2 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing3 setImage:[UIImage imageNamed:quanxing]];

        }else if ((douNumber <= 4.0 && douNumber > 3.5))
        {
            [_xingxingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView2 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView3 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView4 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing1 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing2 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing3 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing4 setImage:[UIImage imageNamed:quanxing]];

        }else if ((douNumber <= 5.0 && douNumber > 4.5))
        {
            [_xingxingImageView1 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView2 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView3 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView4 setImage:[UIImage imageNamed:quanxing]];
            [_xingxingImageView5 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing1 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing2 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing3 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing4 setImage:[UIImage imageNamed:quanxing]];
            [_zhangguixingxing5 setImage:[UIImage imageNamed:quanxing]];

        }
        
    }
    
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
