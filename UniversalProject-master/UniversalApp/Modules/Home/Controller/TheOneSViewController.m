//
//  TheOneSViewController.m
//  YiTalentShow
//
//  Created by  apple on 2017/12/11.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "TheOneSViewController.h"
#import "ShiJianSTableViewCell.h"
#import "GongDanXiangQingSViewController.h"
#import "HomeModel.h"
#import <BaiduMapAPI_Location/BMKLocationService.h>

@interface TheOneSViewController ()<UITableViewDelegate,UITableViewDataSource,BMKLocationServiceDelegate>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, assign) NSInteger CoutPage;
@property ( nonatomic ,strong) NSMutableArray *ModelDic;
@property (nonatomic, assign) NSInteger pages;
@property (nonatomic, strong) BMKLocationService *locService;
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;

@end

@implementation TheOneSViewController

- (BOOL)isHideBackButton
{
    return YES;
}

-(NSMutableArray *)ModelDic
{
    if (!_ModelDic) {
        _ModelDic = [NSMutableArray array];
    }
    return _ModelDic;
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 253)];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_mainTableView];
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        _mainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    }
    return _mainTableView;
}


#pragma mark ————— 下拉刷新 —————
-(void)headerRereshing{
    _CoutPage = 1;
    [self.ModelDic removeAllObjects];
    [self httpRequest];
}

#pragma mark ————— 上拉刷新 —————
-(void)footerRereshing{
    _CoutPage += 1;
    if (_CoutPage <= _pages) {
       [self httpRequest];
    }else
    {
        [self.mainTableView.mj_footer endRefreshingWithNoMoreData];
    }
}

- (void)httpRequest
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/ExpertHomePage/theExpertHomeByPage",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userInfoId", @(_CoutPage),@"currentPage",@(1),@"orderType",@(10),@"pageSize",@(_locService.userLocation.location.coordinate.longitude),@"x",@(_locService.userLocation.location.coordinate.latitude),@"y", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        NSArray *resultDic = [[responseObj objectForKeyWithNullDetection:@"data"] objectForKeyWithNullDetection:@"list"];
        self.pages = [[[responseObj objectForKeyWithNullDetection:@"data"] objectForKeyWithNullDetection:@"pages"] integerValue];
        if (result == 1) {
            for (int i = 0; i < resultDic.count; i++) {
                HomeModel *mode = [HomeModel creatRankingTotalModelWith:resultDic[i]];
                [self.ModelDic addObject:mode];
            }
            [self mainTableView];
        }
        [self requestDataCompleted];
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        [self.mainTableView.mj_header endRefreshing];
        [self.mainTableView.mj_footer endRefreshing];
    }];
}


- (void)viewWillAppear:(BOOL)animated
{
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
//    [self httpRequest];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _CoutPage = 1;

    // Do any additional setup after loading the view from its nib.
}



- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation

{
    
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    if (userLocation.location.coordinate.latitude != 0 && userLocation.location.coordinate.longitude != 0) {
        [self httpRequest];
        self.x = userLocation.location.coordinate.longitude;
        self.y = userLocation.location.coordinate.latitude;
        [self httpRequestmodifyPresentCoord];
    }else
    {
        [self httpRequest];
    }
    
    
    [self.locService stopUserLocationService];
}

- (void)httpRequestmodifyPresentCoord
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/BaiDuMap/modifyPresentCoord",kPRTURL];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userInfoId",@(1),@"DwState",@(_locService.userLocation.location.coordinate.longitude),@"xCoord",@(_locService.userLocation.location.coordinate.latitude),@"yCoord", nil];
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        
    } failure:^(NSError * _Nullable error) {
        
    }];

}


#pragma mark -  logic delegate
-(void)requestDataCompleted{
    [self.mainTableView.mj_header endRefreshing];
    [self.mainTableView.mj_footer endRefreshing];
    [self.mainTableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [tableView tableViewDisplayWitMsg:@"暂无数据" ifNecessaryForRowCount:_ModelDic.count];
    return self.ModelDic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //使用cell重用机制
    static NSString *cellIdentifier = @"ShiJianSIdentifier";//设置cell重用标示
    ShiJianSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //根据标示去找cell，如果有现成的就用现成的
    if (!cell) {
        //没有现成的cell的时候：
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ShiJianSTableViewCell" owner:nil options:nil] firstObject];
    }
    cell.nava = self.Navi;
    if (self.ModelDic.count != 0) {
       [cell initSubViewsWithIndexPath:indexPath Model:self.ModelDic[indexPath.row]];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //给cell设置内容 从之前设置的数据数组中拿数据
    return cell;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    return 332.5;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里是cell的点击事件 点击了cell便触发这个函数
    NSLog(@"点击了cell");
    
//    GongDanXiangQingSVC.homeModel = self.ModelDic[indexPath.row];
    if (self.ModelDic.count != 0) {
        GongDanXiangQingSViewController *GongDanXiangQingSVC = [[GongDanXiangQingSViewController alloc]init];
        GongDanXiangQingSVC.recruitInfoId = [self.ModelDic [indexPath.row] recruitInfoId];
        GongDanXiangQingSVC.y = self.y;
        GongDanXiangQingSVC.x = self.x;
        __block __typeof(self) weakSelf = self;
        [GongDanXiangQingSVC setBlock:^(BOOL isBool) {
            if (isBool) {
                [weakSelf headerRereshing];
            }
        }];
        [self.Navi pushViewController:GongDanXiangQingSVC animated:YES];
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
