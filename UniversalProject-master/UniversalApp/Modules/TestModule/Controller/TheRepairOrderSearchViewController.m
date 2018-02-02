//
//  TheRepairOrderSearchViewController.m
//  YiShopkeeper
//
//  Created by  apple on 2017/11/29.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "TheRepairOrderSearchViewController.h"
#import "ShiJianSTableViewCell.h"
//#import "BasicDisplayTableViewCell.h"
@interface TheRepairOrderSearchViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UITextField *searchTextField;
}
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic ,strong) NSMutableArray *ModelDic;
@property (nonatomic ,strong) NSString *str;
@property (nonatomic, assign) NSInteger CoutPage;
@property (nonatomic, assign) NSInteger pages;


@end

@implementation TheRepairOrderSearchViewController

- (NSMutableArray *)ModelDic
{
    if (!_ModelDic ) {
        _ModelDic = [NSMutableArray array];
    }
    return _ModelDic;
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


#pragma mark ————— 下拉刷新 —————
-(void)headerRereshing{
    _CoutPage = 1;
    [self.ModelDic removeAllObjects];
    if (_str.length != 0 || _str != nil) {
        [self httpRequest];
    }
    
}

#pragma mark ————— 上拉刷新 —————
-(void)footerRereshing{
    _CoutPage += 1;
    if (_str.length != 0 || _str != nil) {
        if (_CoutPage <= _pages) {
            [self httpRequest];
        }else
        {
            [self.mainTableView.mj_footer endRefreshingWithNoMoreData];
        }
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [searchTextField removeFromSuperview];
    searchTextField = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //创建输入框
    _CoutPage = 1;
    searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(50,27, kScreenWidth - 100, 30)];
    searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    searchTextField.font = [UIFont systemFontOfSize:15];
    searchTextField.layer.borderWidth = 1;
    searchTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    searchTextField.backgroundColor = [UIColor colorWithRed:239 /255.0 green:239/255.0 blue:244/255.0 alpha:0.5];
    UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 30, 15)];
    leftImage.contentMode = UIViewContentModeScaleAspectFit;
    leftImage.image = [UIImage imageNamed:@"yg_sy_dhl_tb2"];
    searchTextField.leftViewMode = UITextFieldViewModeAlways;
    searchTextField.returnKeyType = UIReturnKeySearch;
    searchTextField.delegate = self;
    searchTextField.leftView = leftImage;
    searchTextField.layer.cornerRadius = 5;
    searchTextField.placeholder = @"搜索工作名称";
    [searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.navigationController.view addSubview:searchTextField];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ModelDic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //使用cell重用机制
    //设置cell重用标示
    static NSString *cellIdentifier = @"cellIdentifier";
        ShiJianSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            //根据标示去找cell，如果有现成的就用现成的
        if (!cell) {
                //没有现成的cell的时候：
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ShiJianSTableViewCell" owner:nil options:nil] firstObject];
        }
        [cell initSubViewsWithIndexPath:indexPath Model:self.ModelDic[indexPath.row]];
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
    if (tableView == _mainTableView) {
        NSLog(@"点击了mainTableView  cell");
    }
}
#pragma mark 收索监听
- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField.text.length != 0 && textField.text != nil) {
//        [self chaxunTableView];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length != 0 && textField.text != nil) {
        _str = textField.text;
        [self httpRequest];
        
        
    }
    return YES;
}

- (void)httpRequest
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/ExpertHomePage/theExpertHomeByPage",kPRTURL];
    
     NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userInfoId", @(_CoutPage),@"currentPage",@(1),@"orderType",@(10),@"pageSize",_str,@"selectCond", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        
        if (result == 1) {
            NSArray *resultDic = [[responseObj objectForKeyWithNullDetection:@"data"]objectForKeyWithNullDetection:@"list"];
            self.pages = [[[responseObj objectForKeyWithNullDetection:@"data"] objectForKeyWithNullDetection:@"pages"] integerValue];
            for (int i = 0; i < resultDic.count; i++) {
                HomeModel *mode = [HomeModel creatRankingTotalModelWith:resultDic[i]];
                [self.ModelDic addObject:mode];
            }
            
            [self mainTableView];
            [self requestDataCompleted];
        }else if(result == 2)
        {
            [self.view showErrorWithTitle:@"未匹配到相应内容" autoCloseTime:2];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
    }];
}

#pragma mark -  logic delegate
-(void)requestDataCompleted{
    [self.mainTableView.mj_header endRefreshing];
    [self.mainTableView.mj_footer endRefreshing];
    [self.mainTableView reloadData];
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
