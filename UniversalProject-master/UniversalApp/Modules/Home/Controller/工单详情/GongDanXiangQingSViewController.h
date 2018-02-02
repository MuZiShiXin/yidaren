//
//  GongDanXiangQingSViewController.h
//  UniversalApp
//
//  Created by  apple on 2017/12/12.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "RootViewController.h"
#import "HomeModel.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>

typedef void (^GongDanXiangQingSBlock)(BOOL);

@interface GongDanXiangQingSViewController : RootViewController<BMKMapViewDelegate>
@property (nonatomic, copy)GongDanXiangQingSBlock block;
//@property (strong, nonatomic) HomeModel *homeModel;
@property (assign, nonatomic) NSInteger recruitInfoId;

@property (strong ,nonatomic) BMKMapView *mapView;

@property (strong, nonatomic) IBOutlet UIImageView *darentouxiangImageView;
@property (strong, nonatomic) IBOutlet UILabel *gonzuobiaotiLabel;
@property (strong, nonatomic) IBOutlet UILabel *chengdanshuLabel;
@property (strong, nonatomic) IBOutlet UILabel *pingfenLabel;
@property (strong, nonatomic) IBOutlet UIImageView *xingxingImageView1;
@property (strong, nonatomic) IBOutlet UIImageView *xingxingImageView2;
@property (strong, nonatomic) IBOutlet UIImageView *xingxingImageView3;
@property (strong, nonatomic) IBOutlet UIImageView *xingxingImageView4;
@property (strong, nonatomic) IBOutlet UIImageView *xingxingImageView5;
@property (strong, nonatomic) IBOutlet UILabel *gongqianLabel;
@property (strong, nonatomic) IBOutlet UILabel *danweiLabel;
@property (strong, nonatomic) IBOutlet UILabel *fabushijianLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongzuoshijianLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongzuoshichangLabel;

@property (strong, nonatomic) IBOutlet UILabel *gongzuozhiweiLabel;

@property (strong, nonatomic) IBOutlet UILabel *xuyaorenshuLabel;
@property (strong, nonatomic) IBOutlet UILabel *shengyurenshuLabel;
@property (strong, nonatomic) IBOutlet UILabel *yibaorenshuLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongzuodidianLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongdanbianhaoLabel;

@property (strong, nonatomic) IBOutlet UILabel *darenxiangxineirongLabel;
@property (strong, nonatomic) IBOutlet UIImageView *zhangguitouxiangImageView;
@property (strong, nonatomic) IBOutlet UILabel *zhangguimingchengLanel;
@property (strong, nonatomic) IBOutlet UILabel *zhangguichengdanshuLabel;
@property (strong, nonatomic) IBOutlet UILabel *zhangguipingfenLabel;
@property (strong, nonatomic) IBOutlet UIImageView *zhangguixingxing1;
@property (strong, nonatomic) IBOutlet UIImageView *zhangguixingxing2;
@property (strong, nonatomic) IBOutlet UIImageView *zhangguixingxing3;
@property (strong, nonatomic) IBOutlet UIImageView *zhangguixingxing4;
@property (strong, nonatomic) IBOutlet UIImageView *zhangguixingxing5;
@property (strong, nonatomic) IBOutlet UILabel *zhangguileixingLabel;
@property (strong, nonatomic) IBOutlet UILabel *zhangguijianjieLabel;
@property (strong, nonatomic) IBOutlet UILabel *ditugongzuodidianLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongzuozhaopianLabel;


@property (strong, nonatomic) IBOutlet UIView *fourViews;



@property (strong, nonatomic) IBOutlet UIButton *woyaobaomingButton;
@property (strong, nonatomic) IBOutlet UIView *workView;



@end
