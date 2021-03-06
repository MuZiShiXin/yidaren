//
//  gongdanxiaoxixiangqingViewController.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "gongdanxiaoxixiangqingViewController.h"
#import "xiaoximokuaiTableViewCell.h"
#import "xiaoximokuaiTwoTableViewCell.h"
#import "MasseaModel.h"
#import "GongDanXiangQingSViewController.h"

@interface gongdanxiaoxixiangqingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property ( nonatomic ,strong) NSMutableArray *ModelDic;
@property (nonatomic, assign) NSInteger CoutPage;
@property (nonatomic, assign) NSInteger pages;

@end

@implementation gongdanxiaoxixiangqingViewController

-(NSMutableArray *)ModelDic
{
    if (!_ModelDic) {
        _ModelDic = [NSMutableArray array];
    }
    return _ModelDic;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self httpRequest];
}
- (void)httpRequest
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/getMessage",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userDrId",@(1),@"messagetype", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        if (result == 1) {
            self.pages = 1;
            NSArray *resultDic = [responseObj objectForKeyWithNullDetection:@"data"];
            for (int i = 0; i < resultDic.count; i++) {
                MasseaModel *mode = [MasseaModel creatRankingTotalModelWith:resultDic[i]];
                [self.ModelDic addObject:mode];
            }
            [self mainTableView];
            [self requestDataCompleted];
        }else
        {
            
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
    }];
}



- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_mainTableView];
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        _mainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    }
    return _mainTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"工单消息";
    _CoutPage = 1;
    self.view.backgroundColor = [UIColor hx_colorWithHexRGBAString:kBeijingColor];
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

#pragma mark -  logic delegate
-(void)requestDataCompleted{
    [self.mainTableView.mj_header endRefreshing];
    [self.mainTableView.mj_footer endRefreshing];
    [self.mainTableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [tableView tableViewDisplayWitMsg:@"暂无消息" ifNecessaryForRowCount:_ModelDic.count];
    return self.ModelDic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 0 || indexPath.row == 1) {
        //使用cell重用机制
        static NSString *cellIdentifier = @"xiaoximokuaiIdentifier";//设置cell重用标示
        xiaoximokuaiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        //根据标示去找cell，如果有现成的就用现成的
        if (!cell) {
            //没有现成的cell的时候：
            cell = [[[NSBundle mainBundle]loadNibNamed:@"xiaoximokuaiTableViewCell" owner:nil options:nil] firstObject];
        }
        if (self.ModelDic!= nil && self.ModelDic.count != 0) {
            [cell initSubViewsWithIndexPath:indexPath MasseaModelData:self.ModelDic[indexPath.row]];
        }
        //    cell.textLabel.text = [_mainTableViewDataArray objectAtIndex:[indexPath row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //给cell设置内容 从之前设置的数据数组中拿数据
        return cell;
//    }else
//    {
//        //使用cell重用机制
//        static NSString *cellIdentifier = @"xiaoximokuaiIdentifier";//设置cell重用标示
//        xiaoximokuaiTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        //根据标示去找cell，如果有现成的就用现成的
//        if (!cell) {
//            //没有现成的cell的时候：
//            cell = [[[NSBundle mainBundle]loadNibNamed:@"xiaoximokuaiTwoTableViewCell" owner:nil options:nil] firstObject];
//        }
//        cell.BtnZT = @"拒绝提醒";
//        [cell initSubViewsWithIndexPath:indexPath dataArray:nil];
//        //    cell.textLabel.text = [_mainTableViewDataArray objectAtIndex:[indexPath row]];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        //给cell设置内容 从之前设置的数据数组中拿数据
//        return cell;
//    }
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    return 170;
    
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里是cell的点击事件 点击了cell便触发这个函数
    NSLog(@"点击了cell");
    GongDanXiangQingSViewController *GongDanXiangQingSVC = [[GongDanXiangQingSViewController alloc]init];
    GongDanXiangQingSVC.recruitInfoId = [self.ModelDic [indexPath.row] recruitInfoId];
    __block __typeof(self) weakSelf = self;
    [GongDanXiangQingSVC setBlock:^(BOOL isBool) {
        if (isBool) {
            [weakSelf headerRereshing];
        }
    }];
    [self.navigationController pushViewController:GongDanXiangQingSVC animated:YES];
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
