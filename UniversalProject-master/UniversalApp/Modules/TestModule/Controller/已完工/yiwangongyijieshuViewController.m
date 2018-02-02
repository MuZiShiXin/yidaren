//
//  yiwangongyijieshuViewController.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "yiwangongyijieshuViewController.h"
#import "CancelOrderTableViewCell.h"
#import "DingDanXiangQingSViewController.h"
#import "dingdanduozhongzhuangtaiViewController.h"
#import "yiwangongyijieshuModel.h"
@interface yiwangongyijieshuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, assign) NSInteger CoutPage;
@property ( nonatomic ,strong) NSMutableArray *ModelDic;
@property (nonatomic, assign) NSInteger pages;

@end

@implementation yiwangongyijieshuViewController

-(NSMutableArray *)ModelDic
{
    if (!_ModelDic) {
        _ModelDic = [NSMutableArray array];
    }
    return _ModelDic;
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-194)];
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
    NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/MyOrder/mySelfOrderinfo",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userInfoId",@(_CoutPage),@"currentPage",@(10),@"pageSize",@(8),@"orderState", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        NSArray *resultDic = [[responseObj objectForKeyWithNullDetection:@"data"] objectForKeyWithNullDetection:@"list"];
        self.pages = [[[responseObj objectForKeyWithNullDetection:@"data"] objectForKeyWithNullDetection:@"pages"] integerValue];
        if (result == 1) {
            if (resultDic != 0) {
                for (int i = 0; i < resultDic.count; i++) {
                    yiwangongyijieshuModel *mode = [yiwangongyijieshuModel creatRankingTotalModelWith:resultDic[i]];
                    [self.ModelDic addObject:mode];
                }
            }
            [self mainTableView];
            [self requestDataCompleted];
        }else
        {
            
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        [self.mainTableView.mj_header endRefreshing];
        [self.mainTableView.mj_footer endRefreshing];
    }];
}

#pragma mark -  logic delegate
-(void)requestDataCompleted{
    [self.mainTableView.mj_header endRefreshing];
    [self.mainTableView.mj_footer endRefreshing];
    [self.mainTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _CoutPage = 1;
    [self httpRequest];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [tableView tableViewDisplayWitMsg:@"暂无数据" ifNecessaryForRowCount:_ModelDic.count];
    return self.ModelDic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //使用cell重用机制
    static NSString *cellIdentifier = @"cellIdentifier7";//设置cell重用标示
    CancelOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //根据标示去找cell，如果有现成的就用现成的
    if (!cell) {
        //没有现成的cell的时候：
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CancelOrderTableViewCell" owner:nil options:nil] firstObject];
    }
    cell.Navi = self.Navi;
    if (self.ModelDic.count != 0) {
        [cell initSubViewsWithIndexPath:indexPath MyDingDangModel:self.ModelDic[indexPath.row]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //给cell设置内容 从之前设置的数据数组中拿数据
    return cell;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    return 238;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里是cell的点击事件 点击了cell便触发这个函数
    NSLog(@"点击了cell");
    dingdanduozhongzhuangtaiViewController *    dingdanduozhongzhuangtaiVC = [[dingdanduozhongzhuangtaiViewController alloc]init];
    dingdanduozhongzhuangtaiVC.myOrderId = [self.ModelDic[indexPath.row] myOrderId];
    [self.Navi pushViewController:dingdanduozhongzhuangtaiVC animated:YES];
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
