//
//  dingdanduozhongzhuangtaiViewController.h
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "RootViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface dingdanduozhongzhuangtaiViewController : RootViewController<BMKMapViewDelegate>
@property (strong ,nonatomic) BMKMapView *mapView;
@property (assign, nonatomic) NSInteger myOrderId;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImageView1;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImageView2;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImageView3;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImageView4;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImageView5;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImageView6;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImageView7;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImageView8;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImage1;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImage2;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImage3;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImage4;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImage5;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImage6;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImage7;
@property (strong, nonatomic) IBOutlet UIImageView *dingdanzhuangtaiImage8;
@property (strong, nonatomic) IBOutlet UIProgressView *jinduProgressView;
@property (strong, nonatomic) IBOutlet UIView *Views1;

@property (strong, nonatomic) IBOutlet UIImageView *touxiangImageView;
@property (strong, nonatomic) IBOutlet UILabel *gongzuobiaotiLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongqianLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongjiqianshuLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongzuokaishishijianLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongzuoshichangLabel;
@property (strong, nonatomic) IBOutlet UILabel *danweisLabel;

@property (strong, nonatomic) IBOutlet UILabel *gongzhongLabel;
@property (strong, nonatomic) IBOutlet UILabel *xuyaorenshuLabel;

@property (strong, nonatomic) IBOutlet UILabel *shengyurenshuLabel;

@property (strong, nonatomic) IBOutlet UILabel *gongzuojuliLabel;
@property (strong, nonatomic) IBOutlet UILabel *teshuyaoqiuLabel;
@property (strong, nonatomic) IBOutlet UIView *Views2;
@property (strong, nonatomic) IBOutlet UILabel *gongzuoxiangxidizhiLabel;
@property (strong, nonatomic) IBOutlet UIView *Views3;
@property (strong, nonatomic) IBOutlet UILabel *gongdanbianhaoLabel;
@property (strong, nonatomic) IBOutlet UILabel *dingdanbianhaoLabel;
@property (strong, nonatomic) IBOutlet UILabel *baomingshijiansLabel;
@property (strong, nonatomic) IBOutlet UILabel *jiafangquerenTimeLabel;

@property (strong, nonatomic) IBOutlet UILabel *daodaTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *wangongTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *jiafangyanshouTimeLabelS;

@property (strong, nonatomic) IBOutlet UIView *Views4;

@property (strong, nonatomic) IBOutlet UIButton *zhuangtaoSButton;
@property (strong, nonatomic) IBOutlet UILabel *duizhangguipingfenLabel;

@property (strong, nonatomic) IBOutlet UIImageView *zhangguixingxingImageView1;
@property (strong, nonatomic) IBOutlet UIImageView *zhangguixingxingImageView2;
@property (strong, nonatomic) IBOutlet UIImageView *zhangguixingxingImageView3;
@property (strong, nonatomic) IBOutlet UIImageView *zhangguixingxingImageView4;
@property (strong, nonatomic) IBOutlet UIImageView *zhangguixingxingImageView5;
@property (strong, nonatomic) IBOutlet UILabel *duizhangguipingjiaLabels;
@property (strong, nonatomic) IBOutlet UIView *Views5;
@property (strong, nonatomic) IBOutlet UILabel *shengyuqurenTimeLabels;
@property (strong, nonatomic) IBOutlet UIView *Views6;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *HigthView;


@end
