//
//  howlookmeViewController.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "howlookmeViewController.h"
#import "shuikanlewoaTableViewCell.h"
#import "MasseaModel.h"

@interface howlookmeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property ( nonatomic ,strong) NSMutableArray *ModelDic;


@end

@implementation howlookmeViewController

- (NSMutableArray *)ModelDic
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
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userDrId",@(5),@"messagetype", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        if (result == 1) {
            NSArray *resultDic = [responseObj objectForKeyWithNullDetection:@"data"];
            for (int i = 0; i < resultDic.count; i++) {
                MasseaModel *mode = [MasseaModel creatRankingTotalModelWith:resultDic[i]];
                [self.ModelDic addObject:mode];
            }
            [self mainTableView];
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
    }
    return _mainTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"谁看了我";
    self.view.backgroundColor = [UIColor hx_colorWithHexRGBAString:kBeijingColor];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [tableView tableViewDisplayWitMsg:@"暂无消息" ifNecessaryForRowCount:_ModelDic.count];
    return self.ModelDic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        //使用cell重用机制
        static NSString *cellIdentifier = @"shuikanlewoaIdentifier";//设置cell重用标示
        shuikanlewoaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        //根据标示去找cell，如果有现成的就用现成的
        if (!cell) {
            //没有现成的cell的时候：
            cell = [[[NSBundle mainBundle]loadNibNamed:@"shuikanlewoaTableViewCell" owner:nil options:nil] firstObject];
        }
        if (self.ModelDic!= nil && self.ModelDic.count != 0) {
            [cell initSubViewsWithIndexPath:indexPath MasseaModelData:self.ModelDic[indexPath.row]];
        }
        //    cell.textLabel.text = [_mainTableViewDataArray objectAtIndex:[indexPath row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //给cell设置内容 从之前设置的数据数组中拿数据
        return cell;
    
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    return 82;
    
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里是cell的点击事件 点击了cell便触发这个函数
    NSLog(@"点击了cell");
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
