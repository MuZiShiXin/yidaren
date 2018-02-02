//
//  HomeViewController.m
//  YiTalentShow
//
//  Created by  apple on 2017/12/11.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "HomeViewController.h"
#import "SegmentTapView.h"
#import "FlipTableView.h"

#import "TheOneSViewController.h"
#import "TheTwoSViewController.h"
#import "TheThreeSViewController.h"
#import "TheFoursViewController.h"
#import <CoreLocation/CoreLocation.h>


#import "XiaoXiMoKuaiViewController.h"
#import "TheRepairOrderSearchViewController.h"
#import "gerenxinxiViewController.h"
#import "UIViewController+BackButtonHandler.h"

@interface HomeViewController ()
<SegmentTapViewDelegate,FlipTableViewDelegate,CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong)SegmentTapView *segment;
@property (nonatomic, strong)FlipTableView *flipView;
@property (strong, nonatomic) NSMutableArray *controllsArray;


@property (strong, nonatomic) IBOutlet UILabel *dingweididianLabel;

@end

@implementation HomeViewController
// ****************工作技能图片第一张
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initFlipTableView];
    [self initSegment];
    [self startLocation];

}

- (void)viewWillAppear:(BOOL)animated
{
    if (userManager.curUserInfo.wanShanXinXi == 0) {
        gerenxinxiViewController *gerenxinxiVC = [[gerenxinxiViewController alloc]init];
        gerenxinxiVC.WanShanXinXi = @"完善信息";
        [self.navigationController pushViewController:gerenxinxiVC animated:NO];
    }
}




//开始定位
- (void)startLocation {
    if ([CLLocationManager locationServicesEnabled]) {
        //        CLog(@"--------开始定位");
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        //控制定位精度,越高耗电量越
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 总是授权
        [self.locationManager requestAlwaysAuthorization];
        self.locationManager.distanceFilter = 25.0f;
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([error code] == kCLErrorDenied) {
        NSLog(@"访问被拒绝");
    }
    if ([error code] == kCLErrorLocationUnknown) {
        NSLog(@"无法获取位置信息");
    }
}
//定位代理经纬度回调
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *newLocation = locations[0];
    
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
        if (array.count > 0){
            CLPlacemark *placemark = [array objectAtIndex:0];
            
            //获取城市
            NSString *city = placemark.locality;
            if (!city) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
            }
            NSLog(@"city = %@", city);
            _dingweididianLabel.text = city;
//            [self httpGetWeather:city];
        }
        else if (error == nil && [array count] == 0)
        {
            NSLog(@"No results were returned.");
        }
        else if (error != nil)
        {
            NSLog(@"An error occurred = %@", error);
        }
    }];
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
    
}




-(void)initSegment{
    self.segment = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 99, kScreenWidth, 40) withDataArray:[NSArray arrayWithObjects:@"时间倒序",@"好评优先",@"成单最高",@"最近距离", nil] withFont:15];
    self.segment.delegate = self;
    [self.view addSubview:self.segment];
}

-(void)initFlipTableView{
    if (!self.controllsArray) {
        self.controllsArray = [[NSMutableArray alloc] init];
    }
    TheOneSViewController *OneVC = [[TheOneSViewController alloc]init];
    OneVC.Navi = self.navigationController;
    TheTwoSViewController *TwoVC = [[TheTwoSViewController alloc]init];
    TwoVC.Navi = self.navigationController;
    TheThreeSViewController *ThreeVC = [[TheThreeSViewController alloc]init];
    ThreeVC.Navi = self.navigationController;
    TheFoursViewController *FourVC = [[TheFoursViewController alloc]init];
    FourVC.Navi = self.navigationController;
    
    [self.controllsArray addObject:OneVC];
    [self.controllsArray addObject:TwoVC];
    [self.controllsArray addObject:ThreeVC];
    [self.controllsArray addObject:FourVC];
    
    self.flipView = [[FlipTableView alloc] initWithFrame:CGRectMake(0, 139, kScreenWidth, self.view.frame.size.height - 104) withArray:_controllsArray];
    self.flipView.delegate = self;
    [self.view addSubview:self.flipView];
}



#pragma mark 定位
- (IBAction)dingweiBtn {
    
}
#pragma mark 信息
- (IBAction)xinxiBtn {
    XiaoXiMoKuaiViewController *XiaoXiMoKuaiVC = [[XiaoXiMoKuaiViewController alloc]init];
    [self.navigationController pushViewController:XiaoXiMoKuaiVC animated:YES];
}
#pragma mark 收索
- (IBAction)sousuoBtn {
    TheRepairOrderSearchViewController *TheRepairOrderSearchVC = [[TheRepairOrderSearchViewController alloc]init];
    [self.navigationController pushViewController:TheRepairOrderSearchVC animated:YES];
}

#pragma mark -------- select Index
-(void)selectedIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    [self.flipView selectIndex:index];
    
}
-(void)scrollChangeToIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    [self.segment selectIndex:index];
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
