//
//  MyOrderViewController.m
//  YiShopkeeper
//
//  Created by  apple on 2017/11/28.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "MyOrderViewController.h"
#import "SegmentTapView.h"
#import "FlipTableView.h"

#import "TheOneViewController.h"
#import "TheTwoViewController.h"
#import "TheThreeViewController.h"
#import "TheFourViewController.h"

#import "TheRepairOrderSearchViewController.h"


@interface MyOrderViewController ()<SegmentTapViewDelegate,FlipTableViewDelegate>
@property (nonatomic, strong)SegmentTapView *segment;
@property (nonatomic, strong)FlipTableView *flipView;
@property (strong, nonatomic) NSMutableArray *controllsArray;

@end

@implementation MyOrderViewController

- (BOOL)isHideBackButton
{
    return NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =@"我的订单";
    [self initSegment];
    [self initFlipTableView];
}

-(void)initSegment{
    self.segment = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40) withDataArray:[NSArray arrayWithObjects:@"全部",@"进行中",@"已完工",@"已取消", nil] withFont:15];
    self.segment.delegate = self;
    [self.view addSubview:self.segment];
}


-(void)initFlipTableView{
    if (!self.controllsArray) {
        self.controllsArray = [[NSMutableArray alloc] init];
    }
    TheOneViewController *OneVC = [[TheOneViewController alloc]init];
    OneVC.gaodu = @"2";
    OneVC.Navi = self.navigationController;
    TheTwoViewController *TwoVC = [[TheTwoViewController alloc]init];
    TwoVC.gaodu = @"2";
    TwoVC.Navi = self.navigationController;

    TheThreeViewController *ThreeVC = [[TheThreeViewController alloc]init];
    ThreeVC.gaodu = @"2";
    ThreeVC.Navi = self.navigationController;

    TheFourViewController *FourVC = [[TheFourViewController alloc]init];
    FourVC.gaodu = @"2";
    FourVC.Navi = self.navigationController;

    [self.controllsArray addObject:OneVC];
    [self.controllsArray addObject:TwoVC];
    [self.controllsArray addObject:ThreeVC];
    [self.controllsArray addObject:FourVC];
    
    self.flipView = [[FlipTableView alloc] initWithFrame:CGRectMake(0, 40, kScreenWidth, self.view.frame.size.height - 40) withArray:_controllsArray];
    self.flipView.delegate = self;
    [self.view addSubview:self.flipView];
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
